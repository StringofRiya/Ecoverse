unit EditAdminProfile_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, clsCredentialValidation_u,
  dbmEcoverseDB, Registration_u;

type
  TfrmEditProfile = class(TForm)
    Label1: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    cmbSuburb: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSave: TButton;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditProfile: TfrmEditProfile;

implementation

{$R *.dfm}

procedure TfrmEditProfile.BitBtn1Click(Sender: TObject);
begin
  frmEditProfile.Hide;
end;

procedure TfrmEditProfile.btnSaveClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    tblAdmins.First;
    while NOT tblAdmins.EOF do
    begin
      if tblAdmins['Admin_ID'] = iID then
      begin
        tblAdmins.Edit;
        tblAdmins['FirstName'] := edtName.Text;
        tblAdmins['Surname'] := edtSurname.Text;
        tblAdmins['Suburb'] := cmbSuburb.Text;
        tblAdmins.Post;
      end;
      tblAdmins.Next;
    end;
  end;
  ShowMessage('Profile updated');
  frmEditProfile.Hide;
end;

procedure TfrmEditProfile.FormShow(Sender: TObject);
begin
  frmRegistration.SuburbItems;
  frmRegistration.SuburbComboBox(cmbSuburb);

  with dmEcoverse do
  begin
    tblAdmins.First;
    while NOT tblAdmins.EOF do
    begin
      if tblAdmins['Admin_ID'] = iID then
      begin
        edtName.Text := tblAdmins['FirstName'];
        edtSurname.Text := tblAdmins['Surname'];
        cmbSuburb.Text := tblAdmins['Suburb'];
      end;
      tblAdmins.Next;
    end;
  end;
end;

end.
