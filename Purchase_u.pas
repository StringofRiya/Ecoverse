unit Purchase_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  clsCredentialValidation_u, dbmEcoverseDB;

type
  TfrmPurchase = class(TForm)
    redProducts: TRichEdit;
    Label1: TLabel;
    btnYes: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPurchase: TfrmPurchase;

implementation

uses Shop_u, UserHome_u;
{$R *.dfm}

procedure TfrmPurchase.btnCancelClick(Sender: TObject);
begin
  frmPurchase.Hide;
end;

procedure TfrmPurchase.btnYesClick(Sender: TObject);
var
  tFile: TextFile;
  k, iPos, iTotalPoints: integer;
  sLine, sPoints: string;
begin
  iTotalPoints := 0;

  if FileExists('Purchases.txt') = False then
  begin
    ShowMessage('File does not exist');
    Exit;
  end;

  AssignFile(tFile, 'Purchases.txt');
  Append(tFile);

  for k := 0 to Length(arrProducts) - 1 do
  begin
    iPos := Pos(':', arrProducts[k]);
    sLine := arrProducts[k];
    Delete(sLine, 1, iPos + 1);
    iPos := Pos(' ', sLine);
    sPoints := Copy(sLine, 1, iPos - 1);
    iTotalPoints := iTotalPoints + StrToInt(sPoints);
  end;

  with dmEcoverse do
  begin
    if bAdmin = False then
    begin
      tblUsers.First;
      while NOT tblUsers.EOF do
      begin
        if tblUsers['User_ID'] = iID then
        begin
          if iTotalPoints > tblUsers['Points'] then
          begin
            ShowMessage('Insufficient points');
            Exit;
          end;

          tblUsers.Edit;
          tblUsers['Points'] := tblUsers['Points'] - iTotalPoints;
          tblUsers.Post;

          Writeln(tFile, tblUsers['FirstName'] + ' ' + tblUsers['Surname'] +
            ' (User ID: ' + IntToStr(iID) + ')');
          for k := 0 to Length(arrProducts) - 1 do
          begin
            Writeln(tFile, arrProducts[k]);
          end;
          Writeln(tFile, '');
        end;

        tblUsers.Next;
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
          tblAdmins['Points'] := tblAdmins['Points'] - iTotalPoints;
          tblAdmins.Post;

          Writeln(tFile, tblAdmins['FirstName'] + ' ' + tblAdmins['Surname'] +
            ' (Admin ID: ' + IntToStr(iID) + ')');
          for k := 0 to Length(arrProducts) - 1 do
          begin
            Writeln(tFile, arrProducts[k]);
          end;
          Writeln(tFile, '');
        end;

        tblAdmins.Next;
      end;
    end;
  end;

  ShowMessage('Item purchased');
  frmPurchase.Hide;
  frmShop.Hide;
  frmUserHome.Show;
  CloseFile(tFile);
end;

procedure TfrmPurchase.FormShow(Sender: TObject);
var
  k: integer;
begin
  redProducts.Clear;

  for k := 0 to Length(arrProducts) - 1 do
  begin
    redProducts.Lines.Add(arrProducts[k]);
  end;
end;

end.
