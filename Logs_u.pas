unit Logs_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmLogs = class(TForm)
    redLogs: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogs: TfrmLogs;

implementation

{$R *.dfm}

procedure TfrmLogs.FormShow(Sender: TObject);
var tFile : TextFile;
    sLine : string;
begin
  redLogs.Clear;

  if FileExists('Purchases.txt') = False then
  begin
    ShowMessage('File does not exist');
    Exit;
  end;

  AssignFile(tFile, 'Purchases.txt');
  Reset(tFile);

  while NOT EOF(tFile) do
    begin
      Readln(tFile, sLine);
      redLogs.Lines.Add(sLine);
    end;

  CloseFile(tFile);
end;

end.
