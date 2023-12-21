unit AdminLogin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  clsCredentialValidation_u, AdminHome_u;

type
  TfrmAdminLogin = class(TForm)
    edtEmail: TEdit;
    edtPassword: TEdit;
    edtAdminNo: TEdit;
    lblLogin: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnLogin: TButton;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnBack: TBitBtn;
    procedure btnLoginClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminLogin: TfrmAdminLogin;
  objCredentials: TCredentials;
implementation
uses UserLogin_u;
{$R *.dfm}

procedure TfrmAdminLogin.btnBackClick(Sender: TObject);
begin
 frmAdminLogin.Hide;
 frmUserLogin.Show;
end;

procedure TfrmAdminLogin.btnLoginClick(Sender: TObject);
var sEmail, sPassword, sAdminNo : string;
    bAdmin : boolean;
begin
 sEmail := edtEmail.Text;
 sPassword := edtPassword.Text;
 sAdminNo := edtAdminNo.Text;
 bAdmin := True;  //user is an admin

 objCredentials := TCredentials.Create(sEmail,sPassword,sAdminNo,bAdmin);

 if objCredentials.FindEmail = False then
 begin
   ShowMessage('E-mail not registered');
 end
 else
 begin
  if objCredentials.ValidatePassword = False then
  begin
   ShowMessage('Incorrect Password/Admin No.');
  end
  else
  begin
   ShowMessage('Login Successful');
   frmAdminLogin.Hide;
   frmAdminHome.Show;
  end;
 end;

 objCredentials.Free;
end;

end.
