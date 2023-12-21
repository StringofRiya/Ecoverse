unit ManageEvents_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dbmEcoverseDB,
  Vcl.StdCtrls, Host_u, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ComCtrls,
  clsCredentialValidation_u, EditAdminProfile_u;

type
  TfrmManageEvents = class(TForm)
    dbgAdmins: TDBGrid;
    dbgEvents: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnAddEvent: TBitBtn;
    btnAdminName: TButton;
    edtAdmin: TEdit;
    edtEvent: TEdit;
    Label4: TLabel;
    btnEventName: TButton;
    btnSignups: TButton;
    redHosted: TRichEdit;
    btnBack: TBitBtn;
    btnShowAll: TBitBtn;
    btnEditProfile: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddEventClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure dbgAdminsCellClick(Column: TColumn);
    procedure btnSignupsClick(Sender: TObject);
    procedure btnEventNameClick(Sender: TObject);
    procedure btnAdminNameClick(Sender: TObject);
    procedure btnShowAllClick(Sender: TObject);
    procedure btnEditProfileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManageEvents: TfrmManageEvents;
  bAdding: boolean;

implementation

uses AdminHome_u;
{$R *.dfm}

procedure TfrmManageEvents.btnShowAllClick(Sender: TObject);
begin
  with dmEcoverse.qryEvents do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblEvents');
    Active := True;
  end;
end;

procedure TfrmManageEvents.btnAddEventClick(Sender: TObject);
begin
  bAdding := True;
  frmHost.Show;
end;

procedure TfrmManageEvents.btnAdminNameClick(Sender: TObject);
var
  bFound: boolean;
begin
  bFound := False;
  with dmEcoverse do
  begin
    tblAdmins.First;
    while NOT tblAdmins.EOF do
    begin
      if Uppercase(tblAdmins['FirstName']) = Uppercase(edtAdmin.Text) then
      begin
        bFound := True;
        Break;
      end
      else
      begin
        tblAdmins.Next;
      end;
    end;
  end;

  if bFound = True then
  begin
    ShowMessage('Admin found');
  end
  else
  begin
    ShowMessage('Admin not found');
  end;
end;

procedure TfrmManageEvents.btnBackClick(Sender: TObject);
begin
  frmManageEvents.Hide;
  frmAdminHome.Show;
  with dmEcoverse.qryEvents do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblEvents');
    Active := True;
  end;
end;

procedure TfrmManageEvents.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this event?', mtConfirmation,
    mbOkCancel, 0) = mrOk then
  begin
    with dmEcoverse do
    begin
      with dmEcoverse do
      begin
        tblAdmins.First;
        while NOT tblAdmins.EOF do
        begin
          if tblAdmins['Admin_ID'] = qryEvents['Admin_ID'] then //if admin is the host of the event that is deleted
          begin
            tblAdmins.Edit;
            tblAdmins['Hosted_Events'] := tblAdmins['Hosted_Events'] - 1; //Decrease no. of events hosted
            tblAdmins['Points'] := tblAdmins['Points'] - 15; //Decrease no. of points
            tblAdmins.Post;
          end;
          tblAdmins.Next;
        end;

        qryEvents.Delete;
        ShowMessage('Record deleted');
      end;
    end;
  end;
end;

procedure TfrmManageEvents.btnEditClick(Sender: TObject);
begin
  bAdding := False;
  frmHost.Show;
end;

procedure TfrmManageEvents.btnEditProfileClick(Sender: TObject);
begin
 frmEditProfile.Show;
end;

procedure TfrmManageEvents.btnEventNameClick(Sender: TObject);
begin
  with dmEcoverse.qryEvents do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblEvents WHERE Event_Name LIKE "%' +
      edtEvent.Text + '%"');
    Active := True;
  end;
end;

procedure TfrmManageEvents.btnSignupsClick(Sender: TObject);
begin
  with dmEcoverse.qryEvents do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT tblEvents.Event_ID, tblEvents.Event_Name, Count(*) AS Signups'
      + ' FROM tblEvents, tblSignups WHERE (tblEvents.Event_ID = tblSignups.Event_ID)'
      + ' GROUP BY tblEvents.Event_ID, tblEvents.Event_Name');
    Active := True;
  end;

end;

procedure TfrmManageEvents.dbgAdminsCellClick(Column: TColumn);
begin
  redHosted.Clear;
  with dmEcoverse do
  begin
    redHosted.Lines.Add('Events hosted by ' + tblAdmins['FirstName'] + ' ' +
      tblAdmins['Surname'] + ':' + #13);

    qryEvents.First;
    while NOT qryEvents.EOF do
    begin
      if qryEvents['Admin_ID'] = tblAdmins['Admin_ID'] then
      begin
        redHosted.Lines.Add(qryEvents['Event_Name'] + ' (' +
          IntToStr(qryEvents['Event_ID']) + ')');
      end;
      qryEvents.Next;
    end;
  end;
end;

procedure TfrmManageEvents.FormShow(Sender: TObject);
begin
  dbgEvents.DataSource := dmEcoverse.dsrEvents;
  dbgAdmins.DataSource := dmEcoverse.dsrAdmins;
  dbgAdmins.Columns[5].Visible := False;

  edtEvent.Clear;
  edtAdmin.Clear;
  redHosted.Clear;
end;

end.
