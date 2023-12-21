unit RecyclingTimetable_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmTimetable = class(TForm)
    stgTimetable: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTimetable: TfrmTimetable;
  arrHeadings: Array [1 .. 2, 1 .. 5] of string =
    (('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'),
    ('10h00', '11h00', '12h00', '13h00', '14h00')); // Headings in StringGrid
  arrTimetable: Array [1 .. 5, 1 .. 5] of string; // Suburbs per day/time

implementation

uses UserHome_u;
{$R *.dfm}

procedure TfrmTimetable.FormShow(Sender: TObject);
var
  iRow, iCol, iPos: integer;
  tFile: TextFile;
  sDay, sTime, sSuburb, sLine: string;
begin
  if FileExists('CollectionTimes.txt') = False then
  begin
    ShowMessage('File does not exist');
    Exit;
  end;

  AssignFile(tFile, 'CollectionTimes.txt');
  Reset(tFile);

  for iCol := 1 to 5 do // Days
  begin
    stgTimetable.Cells[iCol, 0] := arrHeadings[1, iCol];

    Readln(tFile, sLine);

    iPos := Pos(':', sLine);
    sDay := Copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    if (arrHeadings[1, iCol] = sDay) then
    begin
      for iRow := 1 to 5 do // Times
      begin
        stgTimetable.Cells[0, iRow] := arrHeadings[2, iRow];

        iPos := Pos(',', sLine);
        sTime := Copy(sLine, 1, iPos - 1);

        if arrHeadings[2, iRow] = sTime then
        begin
          Delete(sLine, 1, iPos);
          iPos := Pos(';', sLine);

          begin
            if iPos = 0 then
            begin
              sSuburb := sLine;
              arrTimetable[iCol, iRow] := sSuburb;
              stgTimetable.Cells[iCol, iRow] := arrTimetable[iCol, iRow];
            end
            else
            begin
              sSuburb := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);
              arrTimetable[iCol, iRow] := sSuburb;
              stgTimetable.Cells[iCol, iRow] := arrTimetable[iCol, iRow];
            end;
          end;
        end;

      end;
    end;
  end;

  CloseFile(tFile);

 {Since this is not the main functionality of this program, this procedure only
  displays the suburbs from the text file into the timetable. Therefore if any
  suburbs are added to the arrSuburbs array they will not automatically be added
  to the timetable. Therefore new suburbs will need to be manually added to the
  textfile in order for them to be displayed in the timetable.}
end;

end.
