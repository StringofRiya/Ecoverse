unit AdminHome_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, clsCredentialValidation_u, UserHome_u, Host_u,
  ManageEvents_u, EventParticipants_u, Logs_u, Registration_u;

type
  TfrmAdminHome = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    imgProfile: TImage;
    pnlProfile: TPanel;
    lblName: TLabel;
    lblPoints: TLabel;
    lblEvents: TLabel;
    lblDonations: TLabel;
    lblHosted: TLabel;
    btnLogs: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure imgProfileClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnLogsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminHome: TfrmAdminHome;

implementation

{$R *.dfm}

procedure TfrmAdminHome.BitBtn1Click(Sender: TObject);
begin
 frmParticipants.Show;
end;

procedure TfrmAdminHome.BitBtn2Click(Sender: TObject);
begin
 frmAdminHome.Hide;
 frmUserHome.Show;
end;

procedure TfrmAdminHome.BitBtn3Click(Sender: TObject);
begin
 frmAdminHome.Hide;
 frmHost.Show;
end;

procedure TfrmAdminHome.BitBtn4Click(Sender: TObject);
begin
 frmAdminHome.Hide;
 frmManageEvents.Show;
end;

procedure TfrmAdminHome.btnLogsClick(Sender: TObject);
begin
 frmLogs.Show;
end;

procedure TfrmAdminHome.FormClick(Sender: TObject);
begin
 pnlProfile.Visible := False;
end;

procedure TfrmAdminHome.FormShow(Sender: TObject);
begin
 frmUserHome.ProfileLabels(lblName, lblEvents, lblDonations, lblPoints, lblHosted);
end;

procedure TfrmAdminHome.imgProfileClick(Sender: TObject);
begin
 frmUserHome.ShowProfile(pnlProfile);
end;

end.
