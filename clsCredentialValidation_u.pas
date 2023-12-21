unit clsCredentialValidation_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, dbmEcoverseDB;

type
 TCredentials = Class
   private
    fEmail : string;
    fPassword : string;
    fAdminNo : string;
    fAdmin : boolean;
   public
    Constructor Create(sEmail, sPassword, sAdminNo: string; bAdmin : boolean);
    function FindEmail : Boolean;
    function ValidatePassword : Boolean;
 End;

var bAdmin : boolean;
    iID : integer;

implementation

{ TCredentials }

constructor TCredentials.Create(sEmail, sPassword, sAdminNo: string; bAdmin: boolean);
begin
 fEmail := sEmail;
 fPassword := sPassword;
 fAdminNo := sAdminNo;
 fAdmin := bAdmin;
end;

function TCredentials.FindEmail: Boolean;
begin
 with dmEcoverse do
 begin
   if fAdmin = false then
   begin
     tblUsers.First;
     while NOT tblUsers.EOF do
     begin
       if fEmail = tblUsers['E-mail'] then
       begin
         Result := True;
         Exit;
       end
       else
       begin
         Result := False;
         tblUsers.Next;
       end;
     end;
   end
   else
   begin
     tblAdmins.First;
     while NOT tblAdmins.EOF do
     begin
       if fEmail = tblAdmins['E-mail'] then
       begin
         Result := True;
         Exit;
       end
       else
       begin
         Result := False;
         tblAdmins.Next;
       end;
     end;
   end;
 end;
end;

function TCredentials.ValidatePassword;
begin
 with dmEcoverse do
 begin
   if fAdmin = false then  //if user is not an admin - coming from user login form
   begin
    tblUsers.First;
    while NOT tblUsers.EOF do
    begin
      if fEmail = tblUsers['E-mail'] then
      begin
        if fPassword = tblUsers['Password'] then
        begin
          Result := True;  //password is correct
          bAdmin := False;
          iID := tblUsers['User_ID'];
        end
        else
        begin
          Result := False;  //password is incorrect
        end;
        Exit;
      end
      else
      begin
        tblUsers.Next;
      end;
    end;
   end
   else
   begin
     tblAdmins.First;
     while NOT tblAdmins.EOF do
     begin
       if fEmail = tblAdmins['E-mail'] then
       begin
         if (fPassword = tblAdmins['Password']) AND (fAdminNo = tblAdmins['AdminNo']) then
         begin
           Result := True;
           bAdmin := True;
           iID := tblAdmins['Admin_ID'];
         end
         else
         begin
           Result := False;
         end;
         Exit;
       end
       else
       begin
         tblAdmins.Next;
       end;
     end;
   end;

 end;

end;

end.
