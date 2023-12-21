unit Info_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Reduce_u,
  Reuse_u, Recycle_u;

type
  TfrmInfo = class(TForm)
    Image1: TImage;
    pnlReduce: TPanel;
    pnlReuse: TPanel;
    pnlRecycle: TPanel;
    procedure pnlRecycleClick(Sender: TObject);
    procedure pnlReduceClick(Sender: TObject);
    procedure pnlReuseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

procedure TfrmInfo.pnlRecycleClick(Sender: TObject);
begin
 frmRecycle.Show;
end;

procedure TfrmInfo.pnlReduceClick(Sender: TObject);
begin
 frmReduce.Show;
end;

procedure TfrmInfo.pnlReuseClick(Sender: TObject);
begin
 frmReuse.Show;
end;

end.
