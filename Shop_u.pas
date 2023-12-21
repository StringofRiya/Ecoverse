unit Shop_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Buttons,
  Vcl.ComCtrls, Purchase_u;

type
  TfrmShop = class(TForm)
    Label1: TLabel;
    cbxStraws: TCheckBox;
    Image2: TImage;
    btnCart: TButton;
    cbxRecycup: TCheckBox;
    cbxEcoBag: TCheckBox;
    cbxToothbrush: TCheckBox;
    cbxCutlery: TCheckBox;
    Image3: TImage;
    pnlStraws: TPanel;
    btnBack: TBitBtn;
    pnlRecycup: TPanel;
    Image1: TImage;
    pnlBag: TPanel;
    Image4: TImage;
    pnlToothbrush: TPanel;
    Image7: TImage;
    pnlCutlery: TPanel;
    Image5: TImage;
    pnlNotebook: TPanel;
    Image6: TImage;
    cbxNotebook: TCheckBox;
    procedure cbxStrawsClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure cbxRecycupClick(Sender: TObject);
    procedure cbxEcoBagClick(Sender: TObject);
    procedure cbxToothbrushClick(Sender: TObject);
    procedure cbxCutleryClick(Sender: TObject);
    procedure cbxNotebookClick(Sender: TObject);
    procedure btnCartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShop: TfrmShop;
  arrProducts: Array of string;

implementation

uses UserHome_u;
{$R *.dfm}

procedure TfrmShop.btnBackClick(Sender: TObject);
begin
  frmShop.Hide;
  frmUserHome.Show;
end;

procedure TfrmShop.cbxRecycupClick(Sender: TObject);
var
  k: integer;
begin
  if cbxRecycup.Checked then
  begin
    pnlRecycup.Color := clSilver;
    SetLength(arrProducts, Length(arrProducts) + 1);
    arrProducts[Length(arrProducts) - 1] := cbxRecycup.Caption;
  end
  else
  begin
    pnlRecycup.Color := clWhite;
    for k := 0 to Length(arrProducts) - 1 do
    begin
      if arrProducts[k] = cbxRecycup.Caption then
      begin
        Delete(arrProducts, k, 1);
      end;
    end;
  end;
end;

procedure TfrmShop.cbxStrawsClick(Sender: TObject);
var k : integer;
begin
  if cbxStraws.Checked then
  begin
    pnlStraws.Color := clSilver;
    SetLength(arrProducts, Length(arrProducts) + 1);
    arrProducts[Length(arrProducts) - 1] := cbxStraws.Caption;
  end
  else
  begin
    pnlStraws.Color := clWhite;
    for k := 0 to Length(arrProducts)-1 do
      begin
        if arrProducts[k] = cbxStraws.Caption then
        begin
          Delete(arrProducts, k, 1);
        end;
      end;
  end;
end;

procedure TfrmShop.cbxToothbrushClick(Sender: TObject);
var
  k: integer;
begin
  if cbxToothbrush.Checked then
  begin
    pnlToothbrush.Color := clSilver;
    SetLength(arrProducts, Length(arrProducts) + 1);
    arrProducts[Length(arrProducts) - 1] := cbxToothbrush.Caption;
  end
  else
  begin
    pnlToothbrush.Color := clWhite;
    for k := 0 to Length(arrProducts) - 1 do
    begin
      if arrProducts[k] = cbxToothbrush.Caption then
      begin
        Delete(arrProducts, k, 1);
      end;
    end;
  end;

end;

procedure TfrmShop.cbxNotebookClick(Sender: TObject);
var
  k: integer;
begin
  if cbxNotebook.Checked then
  begin
    pnlNotebook.Color := clSilver;
    SetLength(arrProducts, Length(arrProducts) + 1);
    arrProducts[Length(arrProducts) - 1] := cbxNotebook.Caption;
  end
  else
  begin
    pnlNotebook.Color := clWhite;
    for k := 0 to Length(arrProducts) - 1 do
    begin
      if arrProducts[k] = cbxNotebook.Caption then
      begin
        Delete(arrProducts, k, 1);
      end;
    end;
  end;
end;

procedure TfrmShop.btnCartClick(Sender: TObject);
begin
  if Length(arrProducts) = 0 then
  begin
    ShowMessage('No items selected');
    Exit;
  end
  else
  begin
    frmPurchase.Show;
  end;
end;

procedure TfrmShop.cbxCutleryClick(Sender: TObject);
var
  k: integer;
begin
  if cbxCutlery.Checked then
  begin
    pnlCutlery.Color := clSilver;
    SetLength(arrProducts, Length(arrProducts) + 1);
    arrProducts[Length(arrProducts) - 1] := cbxCutlery.Caption;
  end
  else
  begin
    pnlCutlery.Color := clWhite;
    for k := 0 to Length(arrProducts) - 1 do
    begin
      if arrProducts[k] = cbxCutlery.Caption then
      begin
        Delete(arrProducts, k, 1);
      end;
    end;
  end;
end;

procedure TfrmShop.cbxEcoBagClick(Sender: TObject);
var
  k: integer;
begin
  if cbxEcoBag.Checked then
  begin
    pnlBag.Color := clSilver;
    SetLength(arrProducts, Length(arrProducts) + 1);
    arrProducts[Length(arrProducts) - 1] := cbxEcoBag.Caption;
  end
  else
  begin
    pnlBag.Color := clWhite;
    for k := 0 to Length(arrProducts) - 1 do
    begin
      if arrProducts[k] = cbxEcoBag.Caption then
      begin
        Delete(arrProducts, k, 1);
      end;
    end;
  end;
end;

end.
