unit Donations_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Samples.Spin, clsCredentialValidation_u, dbmEcoverseDB, Vcl.Buttons;

type
  TfrmDonations = class(TForm)
    rgpFundraisers: TRadioGroup;
    lblDonation: TLabel;
    btnDonate: TButton;
    Image1: TImage;
    sedDonation: TSpinEdit;
    Label4: TLabel;
    btnBack: TBitBtn;
    Label1: TLabel;
    procedure btnDonateClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDonations: TfrmDonations;

implementation

uses UserHome_u;

{$R *.dfm}

procedure TfrmDonations.btnBackClick(Sender: TObject);
begin
  frmDonations.Hide;
  frmUserHome.Show;
end;

procedure TfrmDonations.btnDonateClick(Sender: TObject);
begin
  if rgpFundraisers.ItemIndex = -1 then
  begin
    ShowMessage('Please select a fundraiser');
  end
  else
  begin
    if MessageDlg('You are donating R' + IntToStr(sedDonation.Value) + ' to ' +
      rgpFundraisers.Items[rgpFundraisers.ItemIndex] + '.' + #13 +
      'Are you sure you want to proceed with this payment?', mtConfirmation,
      [mbYes, mbCancel], 0) = mrYes then
    begin
      ShowMessage('Thank you for your donation');

      with dmEcoverse do
      begin
        if bAdmin = False then
        begin
          tblUsers.First;
          while NOT tblUsers.EOF do
          begin
            if tblUsers['User_ID'] = iID then
            begin
              tblUsers.Edit;
              tblUsers['Donations'] := tblUsers['Donations'] +
                sedDonation.Value; //Update their Donations value
              tblUsers['Points'] := tblUsers['Points'] +
                Trunc(sedDonation.Value / 2); //Update their Points
              tblUsers.Post;
              Break;
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
            if tblAdmins['Admin_ID'] = iID then
            begin
              tblAdmins.Edit;
              tblAdmins['Donations'] := tblAdmins['Donations'] +
                sedDonation.Value;
              tblAdmins['Points'] := tblAdmins['Points'] +
                Trunc(sedDonation.Value / 2);
              tblAdmins.Post;
              Break;
            end
            else
            begin
              tblAdmins.Next;
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
