unit Registration_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  dbmEcoverseDB, Vcl.ComCtrls, clsCredentialValidation_u, UserHome_u;

type
  TfrmRegistration = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    lblSignup: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    edtPassword: TEdit;
    edtConfirm: TEdit;
    btnSignup: TButton;
    edtEmail: TEdit;
    cmbSuburb: TComboBox;
    lblName: TLabel;
    lblSurname: TLabel;
    lblSuburb: TLabel;
    Label6: TLabel;
    lblPassword: TLabel;
    Label8: TLabel;
    btnBack: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
    procedure SuburbItems; //Assigning suburbs to array (arrSuburbs) from database
    procedure SuburbComboBox(cmbSuburb: TComboBox); //Populates cmbSuburb with suburbs from array (arrSuburbs)
    procedure btnBackClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistration: TfrmRegistration;
  sRegName, sRegSurname, sRegSuburb : string;
  bRegistration : boolean;
  arrSuburbs: Array of string;
  arrCharacters: Array[1..22] of Char = ('!','@','#','$','%','^','&','*','+','-',
  '_','=','(',')','?','~','<','>',',','.','/','\'); //special characters for password

implementation
uses UserLogin_u;
{$R *.dfm}


procedure TfrmRegistration.btnBackClick(Sender: TObject);
begin
 frmRegistration.Hide;
 frmUserLogin.Show;
end;

procedure TfrmRegistration.btnSignupClick(Sender: TObject);
var bComplete, bChar : boolean;
    k : Integer;
begin
 bComplete := True;
 bChar := False;

 if NOT(edtConfirm.Text = edtPassword.Text) then  //Check if passwords match
 begin
   bComplete := False;
   ShowMessage('Passwords do not match');
 end;

 //First check if all fields are filled in
 if (edtName.Text = '') OR (edtSurname.Text = '') OR (cmbSuburb.Text = '')
 OR (edtEmail.Text = '') OR (edtPassword.Text = '') OR (edtConfirm.Text = '') then
 begin
   bComplete := False;
   ShowMessage('Please fill in all information');
 end
 else
 begin
  if Pos('@', edtEmail.text) = 0 then  //if E-mail does not contain an @ symbol
  begin
    bComplete := False;
    ShowMessage('E-mail address must contain "@"');
  end;

  if Length(edtPassword.Text) < 8 then  //if Password has less than 8 characters
  begin
    bComplete := False;
    ShowMessage('Password must have a minimum of 8 characters');
  end;

  for k := 1 to 22 do   //Check if password as at least 1 special character
  begin
    if Pos(arrCharacters[k], edtPassword.Text) = 0 then
    begin
      bChar := False;
    end
    else
    begin
      bChar := True;
      Break;
    end;
  end;

  if bChar = False then
  begin
    bComplete := False;
    ShowMessage('Password must have a special character');
  end;
 end;

 if bComplete = True then
 begin
   with dmEcoverse do
   begin
     tblUsers.Append;
     tblUsers['FirstName'] := edtName.Text;
     tblUsers['Surname'] := edtSurname.Text;
     tblUsers['E-mail'] := edtEmail.Text;
     tblUsers['Password'] := edtPassword.Text;
     tblUsers['Suburb'] := cmbSuburb.Text;
     tblUsers['Events'] := 0;
     tblUsers['Donations'] := 0;
     tblUsers['Points'] := 0;
     tblUsers.Post;

     iID := tblUsers['User_ID'];
    { sName := tblUsers['Firstname'];
     sSurname := tblUsers['Surname'];
     sSuburb := tblUsers['Suburb'];
     iEvents := tblUsers['Events'];
     rDonations := tblUsers['Donations'];
     iPoints := tblUsers['Points']; }
   end;

   ShowMessage('Registration Successful');
   frmRegistration.Hide;
   frmUserHome.Show;
 end;

end;

procedure TfrmRegistration.FormShow(Sender: TObject);
begin
 lblName.Top := 77;
 lblName.Left := 51;
 edtName.Top := 95;
 lblSuburb.Top := 130;
 cmbSuburb.Top := 148;
 lblPassword.Top := 183;
 edtPassword.Top := 201;
 lblSurname.Left := 228;

 SuburbItems;
 SuburbComboBox(cmbSuburb);
end;

procedure TfrmRegistration.SuburbComboBox(cmbSuburb: TComboBox);
var k : integer;
begin
 cmbSuburb.Items.Clear;
 for k := 0 to Length(arrSuburbs)-1 do
   begin
     cmbSuburb.Items.Add(arrSuburbs[k]);  //cmbSuburb.Items.Add(qryUsers['Suburb'])
   end;
end;

procedure TfrmRegistration.SuburbItems;
var k : integer;
begin
 with dmEcoverse do
 begin
   qryUsers2.Close;
   qryUsers2.SQL.Clear;
   qryUsers2.SQL.Add('Select DISTINCT Suburb FROM tblUsers');
   qryUsers2.Open;

   SetLength(arrSuburbs, qryUsers2.RecordCount); //Set length of array to the number of records (or suburbs) in qryUsers
   qryUsers2.First;
   for k := 0 to qryUsers2.RecordCount-1 do
     begin
       arrSuburbs[k] := qryUsers2['Suburb'];
       qryUsers2.Next;
     end;
 end;
end;

end.
