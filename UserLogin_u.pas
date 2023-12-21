unit UserLogin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Registration_u, clsCredentialValidation_u, UserHome_u, AdminLogin_u,
  Vcl.Imaging.pngimage;

type
  TfrmUserLogin = class(TForm)
    lblLogin: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPassword: TEdit;
    Panel1: TPanel;
    btnLogin: TButton;
    Label1: TLabel;
    lblPassword: TLabel;
    edtEmail: TEdit;
    Label4: TLabel;
    btnAdLogin: TBitBtn;
    procedure btnLoginClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserLogin: TfrmUserLogin;
  objCredentials : TCredentials;

implementation

{$R *.dfm}

procedure TfrmUserLogin.btnAdLoginClick(Sender: TObject);
begin
  frmUserLogin.Hide;
  frmAdminLogin.Show;
end;

procedure TfrmUserLogin.btnLoginClick(Sender: TObject);
var sEmail, sPassword, sAdminNo : string;
    bAdmin : boolean;
begin
 sEmail := edtEmail.Text;
 sPassword := edtPassword.Text;
 bAdmin := False;  //user is not an admin

 objCredentials := TCredentials.Create(sEmail,sPassword,sAdminNo,bAdmin);

 if objCredentials.FindEmail = False then
 begin
   ShowMessage('E-mail not registered');
 end
 else
 begin
   if objCredentials.ValidatePassword = True then  //if password is correct
   begin
    ShowMessage('Login Successful');
    frmUserLogin.Hide;
    frmUserHome.Show;
   end
   else
   begin
    ShowMessage('Incorrect E-mail/Password');
   end;
 end;

 objCredentials.Free;
end;

procedure TfrmUserLogin.FormShow(Sender: TObject);
begin
 edtEmail.SetFocus;
end;

procedure TfrmUserLogin.Label1Click(Sender: TObject);
begin
 frmUserLogin.Hide;
 frmRegistration.Show;
end;

end.
