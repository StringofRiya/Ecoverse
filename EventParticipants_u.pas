unit EventParticipants_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dbmEcoverseDB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Samples.Spin, System.UITypes, Registration_u;

type
  TfrmParticipants = class(TForm)
    dbgSignups: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    btnDelete: TButton;
    btnSearch: TButton;
    btnFilterByPoints: TButton;
    Label2: TLabel;
    Label3: TLabel;
    btnFilter: TButton;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sedID: TSpinEdit;
    btnUnfilter: TBitBtn;
    btnBack: TBitBtn;
    btnAll: TBitBtn;
    dbgUsers: TDBGrid;
    btnUsersPerSuburb: TButton;
    DBcbxPresent: TDBCheckBox;
    Label4: TLabel;
    DBedtName: TDBEdit;
    DBedtSurname: TDBEdit;
    DBcmbSuburb: TDBComboBox;
    btnTotalDonations: TButton;
    dbgUsers2: TDBGrid;
    btnMostEvents: TButton;
    procedure btnFilterClick(Sender: TObject);
    procedure btnEventNameClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnFilterByPointsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUnfilterClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure btnUsersPerSuburbClick(Sender: TObject);
    procedure DBcbxPresentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTotalDonationsClick(Sender: TObject);
    procedure btnMostEventsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParticipants: TfrmParticipants;

implementation

uses AdminHome_u;

{$R *.dfm}

procedure TfrmParticipants.btnSearchClick(Sender: TObject);
var
  sName: string;
begin
  sName := InputBox('User Name', 'Enter First Name', '');
  with dmEcoverse.qryUsers do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblUsers WHERE FirstName = "' + sName + '"');
    Open;
  end;

  dbgUsers.Show;
  dbgUsers2.Hide;
  dbgUsers.Columns[4].Visible := False;
  TFloatField(dmEcoverse.qryUsers.FieldByName('Donations')).DisplayFormat := '"R"0.00';
end;

procedure TfrmParticipants.btnUsersPerSuburbClick(Sender: TObject);
var sSuburb : string;
begin
  with dmEcoverse do
  begin
    sSuburb := qryUsers['Suburb'];
    qryUsers.Close;
    qryUsers.SQL.Clear;
    qryUsers.SQL.Add('SELECT * FROM tblUsers WHERE Suburb = "' +
      sSuburb + '"');
    qryUsers.Open;

    dbgUsers.Show;
    dbgUsers2.Hide;
    dbgUsers.Columns[4].Visible := False;
    TFloatField(qryUsers.FieldByName('Donations')).DisplayFormat := '"R"0.00';
  end;
end;

procedure TfrmParticipants.DBcbxPresentClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
      if tblSignups['Admin_ID'] = Null then  //if a regular user signed up for the event
      begin
        qryUsers.First;
        while NOT qryUsers.EOF do
        begin
          if qryUsers['User_ID'] = tblSignups['User_ID'] then
          begin
            qryUsers.Edit;
            if tblSignups['Present'] = False then  //if user is present (Present field is becoming true)
            begin
              qryUsers['Events'] := qryUsers['Events'] + 1;  //increase no. of participated events
              qryUsers['Points'] := qryUsers['Points'] + 10; //increase no. of points
            end
            else  //if user is not present (but they were ticked as present at first)
            begin
              qryUsers['Events'] := qryUsers['Events'] - 1; //decrease no. of participated events
              qryUsers['Points'] := qryUsers['Points'] - 10; //decrease no. of points
            end;
          end;
          qryUsers.Next;
        end;
      end
      else  //if an admin signed up for the event
      begin
        tblAdmins.First;
        while NOT tblAdmins.EOF do
        begin
          if tblAdmins['Admin_ID'] = tblSignups['Admin_ID'] then
          begin
            tblAdmins.Edit;
            if tblSignups['Present'] = False then
            begin
              tblAdmins['Participated_Events'] := tblAdmins['Participated_Events'] + 1;
              tblAdmins['Points'] := tblAdmins['Points'] + 10;
            end
            else
            begin
              tblAdmins['Participated_Events'] := tblAdmins['Participated_Events'] - 1;
              tblAdmins['Points'] := tblAdmins['Points'] - 10;
            end;
            tblAdmins.Post;
          end;
          tblAdmins.Next;
        end;
      end;
  end;
end;

procedure TfrmParticipants.btnUnfilterClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    tblSignups.Filtered := False;
  end;
end;

procedure TfrmParticipants.btnAllClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    qryUsers.Close;
    qryUsers.SQL.Clear;
    qryUsers.SQL.Add('SELECT * FROM tblUsers');
    qryUsers.Open;
    dbgUsers.Show;
    dbgUsers2.Hide;
    dbgUsers.Columns[4].Visible := False;
    TFloatField(qryUsers.FieldByName('Donations')).DisplayFormat := '"R"0.00';
  end;
end;

procedure TfrmParticipants.btnTotalDonationsClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    qryUsers2.Close;
    qryUsers2.SQL.Clear;
    qryUsers2.SQL.Add('SELECT FORMAT(SUM(Donations), "Currency") AS [Total Donations] FROM tblUsers');
    qryUsers2.Open;
  end;
  dbgUsers.Hide;
  dbgUsers2.Show;
end;

procedure TfrmParticipants.btnBackClick(Sender: TObject);
begin
  frmParticipants.Close;
  frmAdminHome.Show;
end;

procedure TfrmParticipants.btnDeleteClick(Sender: TObject);
var
  iUserID: integer;
begin
 dbgUsers2.Hide;
 dbgUsers.Show;

  with dmEcoverse do
  begin
    iUserID := qryUsers['User_ID'];

    if MessageDLG('Are you sure you want to delete the record for ' +
      qryUsers['FirstName'] + ' ' + qryUsers['Surname'] + '?', mtConfirmation,
      mbOkCancel, 0) = mrOk then
    begin
      qryUsers.Close;
      qryUsers.SQL.Clear;
      qryUsers.SQL.Add('DELETE FROM tblUsers WHERE User_ID = ' +
        IntToStr(iUserID));
      qryUsers.ExecSQL;

      qryUsers.Close;
      qryUsers.SQL.Clear;
      qryUsers.SQL.Add('SELECT * FROM tblUsers');
      qryUsers.Open;

      dbgUsers.Columns[4].Visible := False;
      TFloatField(qryUsers.FieldByName('Donations')).DisplayFormat := '"R"0.00';
      ShowMessage('Record Deleted');
    end;
  end;
end;

procedure TfrmParticipants.btnEventNameClick(Sender: TObject);
var
  sEvent: string;
begin
  with dmEcoverse do
  begin
    tblEvents.First;
    while NOT tblEvents.EOF do
    begin
      if tblEvents['Event_ID'] = sedID.Value then
      begin
        sEvent := tblEvents['Event_Name'];
        Break;
      end
      else
      Begin
        tblEvents.Next;
      End;
    end;
  end;

  ShowMessage(sEvent);
end;

procedure TfrmParticipants.btnFilterByPointsClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    qryUsers.Close;
    qryUsers.SQL.Clear;
    qryUsers.SQL.Add('SELECT * FROM tblUsers ORDER BY Points DESC');
    qryUsers.Open;
    dbgUsers2.Hide;
    dbgUsers.Show;
    dbgUsers.Columns[4].Visible := False;
    TFloatField(dmEcoverse.qryUsers.FieldByName('Donations')).DisplayFormat := '"R"0.00';
  end;
end;

procedure TfrmParticipants.btnFilterClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    tblSignups.Filtered := False;
    tblSignups.Filter := 'Event_ID = ' + IntToStr(sedID.Value);
    tblSignups.Filtered := True;
  end;
end;

procedure TfrmParticipants.btnMostEventsClick(Sender: TObject);
begin
  with dmEcoverse do
  begin
    qryUsers2.Close;
    qryUsers2.SQL.Clear;
    qryUsers2.SQL.Add('SELECT MAX(Events) AS [Most Participated Events] FROM tblUsers');
    qryUsers2.Open;
  end;
  dbgUsers.Hide;
  dbgUsers2.Show;
end;

procedure TfrmParticipants.FormCreate(Sender: TObject);
begin
  dbgUsers.DataSource := dmEcoverse.dsrUsers;
  dbgUsers2.DataSource := dmEcoverse.dsrUsers2;
  dbgSignups.DataSource := dmEcoverse.dsrSignups;

  DBedtName.DataSource := dmEcoverse.dsrUsers;
  DBedtName.DataField := 'FirstName';

  DBedtSurname.DataSource := dmEcoverse.dsrUsers;
  DBedtSurname.DataField := 'Surname';

  DBcmbSuburb.DataSource := dmEcoverse.dsrUsers;
  DBcmbSuburb.DataField := 'Suburb';

  DBcbxPresent.DataSource := dmEcoverse.dsrSignups;
  DBcbxPresent.DataField := 'Present';
end;

procedure TfrmParticipants.FormShow(Sender: TObject);
var k : integer;
begin
  with dmEcoverse do
  begin
    qryUsers.Close;
    qryUsers.SQL.Clear;
    qryUsers.SQL.Add('SELECT * FROM tblUsers');
    qryUsers.Open;
  end;

  dbgUsers.Show;
  dbgUsers2.Hide;
  dbgUsers.Columns[4].Visible := False;
  TFloatField(dmEcoverse.qryUsers.FieldByName('Donations')).DisplayFormat := '"R"0.00';

  frmRegistration.SuburbItems;

  DBcmbSuburb.Items.Clear;
  for k := 0 to Length(arrSuburbs)-1 do
    begin
      DBcmbSuburb.Items.Add(arrSuburbs[k]);
    end;

end;

end.
