unit Help_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmHelp = class(TForm)
    redHelp: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}

procedure TfrmHelp.FormShow(Sender: TObject);
var tFile : TextFile;
    sLine : string;
begin
 redHelp.Clear;

 if FileExists('Help.txt') = False then
 begin
   ShowMessage('File does not exist');
   Exit;
 end;

 AssignFile(tFile, 'Help.txt');
 Reset(tFile);

 while NOT EOF(tFile) do
 begin
   Readln(tFile, sLine);
   redHelp.Lines.Add(sLine);
 end;

 CloseFile(tFile);
end;

end.
