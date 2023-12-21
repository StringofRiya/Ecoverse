unit UserHome_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, clsCredentialValidation_u,
  Donations_u,
  dbmEcoverseDB, EventSignUp_u, Help_u, Shop_u, RecyclingTimetable_u, Info_u;

type
  TfrmUserHome = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnInfo: TBitBtn;
    pnlEvents: TPanel;
    lblUpcoming: TLabel;
    Image1: TImage;
    btnDonate: TBitBtn;
    btnHelp: TBitBtn;
    imgProfile: TImage;
    btnShop: TBitBtn;
    btnTimetable: TBitBtn;
    pnlProfile: TPanel;
    lblName: TLabel;
    lblPoints: TLabel;
    lblEvents: TLabel;
    lblDonations: TLabel;
    lstEvents: TListBox;
    btnView: TButton;
    btnBack: TBitBtn;
    Label4: TLabel;
    lblHosted: TLabel;
    procedure btnDonateClick(Sender: TObject);
    procedure imgProfileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure ProfileLabels(lblName, lblEvents, lblDonations,
      lblPoints, lblHosted: TLabel); // Method (Procedure)
    procedure ShowProfile(pnlProfile: TPanel); // Method (Procedure)
    procedure btnViewClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnShopClick(Sender: TObject);
    procedure btnTimetableClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserHome: TfrmUserHome;
  iEventID: integer;

implementation

uses AdminHome_u, Registration_u;

{$R *.dfm}

procedure TfrmUserHome.btnTimetableClick(Sender: TObject);
begin
  frmTimetable.Show;
end;

procedure TfrmUserHome.btnBackClick(Sender: TObject);
begin
  frmUserHome.Hide;
  frmAdminHome.Show;
end;

procedure TfrmUserHome.btnDonateClick(Sender: TObject);
begin
  frmUserHome.Hide;
  frmDonations.Show;
end;

procedure TfrmUserHome.btnHelpClick(Sender: TObject);
begin
  frmHelp.Show;
end;

procedure TfrmUserHome.btnInfoClick(Sender: TObject);
begin
 frmInfo.Show;
end;

procedure TfrmUserHome.btnShopClick(Sender: TObject);
begin
  frmUserHome.Hide;
  frmShop.Show;
end;

procedure TfrmUserHome.btnViewClick(Sender: TObject);
var
  sEvent: string;
  iPos: integer;
begin
  if lstEvents.ItemIndex = -1 then
  begin
    ShowMessage('Please select the event you want to view');
  end
  else
  begin
    sEvent := lstEvents.Items[lstEvents.ItemIndex];
    iPos := Pos('(', sEvent);
    Delete(sEvent, 1, iPos);
    iPos := Pos(')', sEvent);
    iEventID := StrToInt(Copy(sEvent, 1, iPos - 1));
    frmSignUp.Show;
  end;
end;

procedure TfrmUserHome.FormClick(Sender: TObject);
begin
  pnlProfile.Visible := False; // Hide panel when form is clicked
end;

procedure TfrmUserHome.FormShow(Sender: TObject);
begin
  lstEvents.Clear;
  ProfileLabels(lblName, lblEvents, lblDonations, lblPoints, lblHosted); // Call procedure ProfileLabels

  with dmEcoverse do
  begin
    qryEvents.First;
    while NOT qryEvents.EOF do
    begin
      if qryEvents['Date&Time'] > Now then // if the date/time of event has not passed
      begin
        // Display events from Database into Listbox
        lstEvents.Items.Add(qryEvents['Event_Name'] + ' (' +
          IntToStr(qryEvents['Event_ID']) + ')');
      end;
      qryEvents.Next;
    end;
  end;

  if bAdmin = False then
  // if an admin is accessing user home page from admin home page
  begin
    imgProfile.Show;
    btnBack.Hide;
  end
  else
  begin
    imgProfile.Hide;
    btnBack.Show;
  end;

end;

procedure TfrmUserHome.imgProfileClick(Sender: TObject);
begin
  ShowProfile(pnlProfile);
end;

procedure TfrmUserHome.ProfileLabels(lblName, lblEvents, lblDonations,
  lblPoints, lblHosted: TLabel);
begin
  with dmEcoverse do
  begin
    if bAdmin = False then
    begin
      lblHosted.Visible := False;
      tblUsers.First;
      while NOT tblUsers.EOF do
      begin
        if iID = tblUsers['User_ID'] then
        begin
          lblName.Caption := tblUsers['FirstName'] + ' ' + tblUsers['Surname'];
          lblName.Alignment := taCenter;
          lblName.Width := 125;
          lblEvents.Caption := 'Events: ' + IntToStr(tblUsers['Events']);
          lblDonations.Caption := 'Donations: ' +
           FloatToStrF(tblUsers['Donations'], ffCurrency, 8, 2);
          lblPoints.Caption := 'Total Points: ' + IntToStr(tblUsers['Points']);
        end;
        tblUsers.Next;
      end;
    end
    else
    begin
      lblHosted.Visible := True;
      tblAdmins.First;
      while NOT tblAdmins.EOF do
      begin
        if iID = tblAdmins['Admin_ID'] then
        begin
          lblName.Caption := tblAdmins['FirstName'] + ' ' + tblAdmins['Surname'];
          lblName.Alignment := taCenter;
          lblName.Width := 125;
          lblHosted.Caption := 'Hosted Events: ' + IntToStr(tblAdmins['Hosted_Events']);
          lblEvents.Caption := 'Events: ' + IntToStr(tblAdmins['Participated_Events']);
          lblDonations.Caption := 'Donations: ' +
           FloatToStrF(tblAdmins['Donations'], ffCurrency, 8, 2);
          lblPoints.Caption := 'Total Points: ' + IntToStr(tblAdmins['Points']);
        end;
        tblAdmins.Next;
      end;
    end;
  end;
end;

procedure TfrmUserHome.ShowProfile(pnlProfile: TPanel);
begin
  if pnlProfile.Visible = False then
  begin
    pnlProfile.Visible := True;
  end
  else
  begin
    pnlProfile.Visible := False;
  end;
end;

end.
