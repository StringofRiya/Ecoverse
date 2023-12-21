unit Host_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Web.HTTPApp, Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.Imaging.pngimage, UserHome_u,
  dbmEcoverseDB, clsCredentialValidation_u;

type
  TfrmHost = class(TForm)
    lblEvent: TLabel;
    edtEvent: TEdit;
    btnDone: TBitBtn;
    lblPlace: TLabel;
    edtPlace: TEdit;
    dtpDate: TDateTimePicker;
    lblDate: TLabel;
    redDesc: TRichEdit;
    lblHeading: TLabel;
    lblDesc: TLabel;
    dtpTime: TDateTimePicker;
    lblTime: TLabel;
    procedure btnDoneClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHost: TfrmHost;

implementation
uses AdminHome_u, ManageEvents_u;
{$R *.dfm}

procedure TfrmHost.btnBackClick(Sender: TObject);
begin
 frmHost.Hide;
 frmAdminHome.Show;
end;

procedure TfrmHost.btnDoneClick(Sender: TObject);
begin
 if (Length(edtEvent.Text) = 0) OR (Length(edtPlace.Text) = 0) then
 begin
   ShowMessage('Please fill in all information');
 end
 else
 begin
   if MessageDlg('Confirm?', mtConfirmation, mbOkCancel, 0) = mrOk then
   begin
     with dmEcoverse do
     begin
       if bAdding = True then
       begin
         qryEvents.Append;
       end
       else
       begin
         qryEvents.Edit;
       end;
       qryEvents['Event_Name'] := edtEvent.Text;
       qryEvents['Place'] := edtPlace.Text;
       qryEvents['Date&Time'] := dtpDate.Date + dtpTime.Time;
       qryEvents['Admin_ID'] := iID; //ID of admin hosting event
       qryEvents['Description'] := redDesc.Text;
       // tblEvents['Image'].Add(imgEvent.Picture);
       // tblEvents['Image'] := imgEvent.Picture;
       qryEvents.Post;
     end;

     if bAdding = True then
     begin
       ShowMessage('Event Added');
       with dmEcoverse do
       begin
         tblAdmins.First;
         while NOT tblAdmins.EOF do
         begin
           if tblAdmins['Admin_ID'] = iID then
           begin
             tblAdmins.Edit;
             tblAdmins['Hosted_Events'] := tblAdmins['Hosted_Events'] + 1;
             tblAdmins['Points'] := tblAdmins['Points'] + 15;
             Break;
           end
           else
           begin
             tblAdmins.Next;
           end;
         end;
       end;
       frmHost.Hide;
     end
     else
     begin
       ShowMessage('Event Updated');
     end;
   end;

 end;

end;

procedure TfrmHost.FormShow(Sender: TObject);
begin
 if bAdding = False then
 begin
   with dmEcoverse do
   begin
     lblHeading.Caption := qryEvents['Event_Name'];
     lblHeading.Alignment := taCenter;
     lblHeading.Width := 401;
     edtEvent.Text := qryEvents['Event_Name'];
     edtPlace.Text := qryEvents['Place'];
     dtpDate.Date := qryEvents['Date&Time'];
     dtpTime.Time := qryEvents['Date&Time'];
     redDesc.Text := qryEvents['Description'];
   end;
 end
 else
 begin
   lblHeading.Caption := 'Host Event';
   lblHeading.Alignment := taCenter;
   lblHeading.Width := 401;
 end;
end;

end.
