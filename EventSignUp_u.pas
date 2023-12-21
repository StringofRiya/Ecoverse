unit EventSignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, dbmEcoverseDB, clsCredentialValidation_u;

type
  TfrmSignup = class(TForm)
    lblHeading: TLabel;
    btnJoin: TButton;
    imgEvent: TImage;
    redDesc: TRichEdit;
    btnClose: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    lblEvent: TLabel;
    Label4: TLabel;
    lblPlace: TLabel;
    Label6: TLabel;
    lblTime: TLabel;
    Label8: TLabel;
    lblHost: TLabel;
    Label1: TLabel;
    lblDate: TLabel;
    Label3: TLabel;
    imgDefault: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;
  sEvent: string;

implementation

uses UserHome_u;
{$R *.dfm}

procedure TfrmSignup.btnJoinClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    if MessageDlg('Are you sure you want to join the ' + sEvent + '?',
      mtConfirmation, mbOkCancel, 0) = mrOk then
    begin
      tblSignups.Append;  //Add user to the Signups database table
      if bAdmin = False then
      begin
        tblSignups['User_ID'] := iID; //if user is a regular user
      end
      else
      begin
        tblSignups['Admin_ID'] := iID; //if user is an admin
      end;
      tblSignups['Event_ID'] := iEventID;
      tblSignups['Signup_Date'] := Date;
      tblSignups['Present'] := False;
      tblSignups.Post;
      ShowMessage('You have signed up for the event: ' + sEvent);
      btnJoin.Caption := 'Joined';
      btnJoin.Enabled := False; //user cannot join an event they already joined
    end;
  end;

end;

procedure TfrmSignup.FormShow(Sender: TObject);
begin
  redDesc.Clear;
  btnJoin.Caption := 'Join';
  btnJoin.Enabled := True;

  with dmEcoverse do
  begin
    qryEvents.First;
    while NOT qryEvents.EOF do
    begin
      if qryEvents['Event_ID'] = iEventID then
      begin
        //Copy details of event in the form
        sEvent := qryEvents['Event_Name'];
        lblHeading.Caption := sEvent;
        lblHeading.Alignment := taCenter;
        lblHeading.Width := 330;
        lblEvent.Caption := sEvent;
        lblPlace.Caption := qryEvents['Place'];
        lblDate.Caption := DateToStr(qryEvents['Date&Time']);
        lblTime.Caption := FormatDateTime('hh:nn', qryEvents['Date&Time']); //omit seconds

        tblAdmins.First;
        while NOT tblAdmins.EOF do
        begin
          if tblAdmins['Admin_ID'] = qryEvents['Admin_ID'] then
          begin
            lblHost.Caption := tblAdmins['FirstName'] + ' ' +
              tblAdmins['Surname'];
            Break; //Exit loop once tblAdmins['Admin_ID'] = tblEvents['Admin_ID']
          end
          else
          begin
            tblAdmins.Next;
          end;
        end;

        redDesc.Text := qryEvents['Description'];
        // imgEvent.Picture.Assign(tblEvents['Image']);

        if qryEvents['Admin_ID'] = iID then
        begin
          btnJoin.Caption := 'Hosted';
          btnJoin.Enabled := False;
        end;

        Break; //Exit loop once event is found
      end
      else
      begin
        qryEvents.Next;
      end;
    end;

    tblSignups.First;
    while NOT tblSignups.EOF do
    begin
      if (tblSignups['Event_ID'] = iEventID) AND
        ((tblSignups['User_ID'] = iID) OR (tblSignups['Admin_ID'] = iID)) then
         //if user has already joined the event
      begin
        btnJoin.Caption := 'Joined';
        btnJoin.Enabled := False;
      end;
      tblSignups.Next;
    end;
  end;
end;

end.
