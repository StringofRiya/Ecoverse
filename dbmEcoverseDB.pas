unit dbmEcoverseDB;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmEcoverse = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conEcoverse : TADOConnection;
    tblUsers : TADOTable;
    tblAdmins : TADOTable;
    tblSignups : TADOTable;
    tblEvents : TADOTable;
    qryUsers : TADOQuery;
    qryUsers2 : TADOQuery;
    qryEvents : TADOQuery;
    dsrUsers : TDataSource;
    dsrUsers2 : TDataSource;
    dsrEvents : TDataSource;
    dsrAdmins : TDataSource;
    dsrSignups : TDataSource;
  end;

var
  dmEcoverse: TdmEcoverse;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmEcoverse.DataModuleCreate(Sender: TObject);
begin
 conEcoverse := TADOConnection.Create(dmEcoverse);
 tblUsers := TADOTable.Create(dmEcoverse);
 tblAdmins := TADOTable.Create(dmEcoverse);
 tblSignups := TADOTable.Create(dmEcoverse);
 tblEvents := TADOTable.Create(dmEcoverse);
 qryUsers := TADOQuery.Create(dmEcoverse);
 qryUsers2 := TADOQuery.Create(dmEcoverse);
 qryEvents := TADOQuery.Create(dmEcoverse);
 dsrUsers := TDataSource.Create(dmEcoverse);
 dsrUsers2 := TDataSource.Create(dmEcoverse);
 dsrEvents := TDataSource.Create(dmEcoverse);
 dsrAdmins := TDataSource.Create(dmEcoverse);
 dsrSignups := TDataSource.Create(dmEcoverse);

 conEcoverse.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Riya\Documents\Grade 12 PAT - Final\Win32\Debug\EcoverseDB.mdb;Mode=ReadWrite;Persist Security Info=False';
 conEcoverse.LoginPrompt := False;
 conEcoverse.Open;

 tblUsers.Connection := conEcoverse;
 tblUsers.TableName := 'tblUsers';
 tblUsers.Open;

 tblAdmins.Connection := conEcoverse;
 tblAdmins.TableName := 'tblAdmins';
 tblAdmins.Open;
 TFloatField(tblAdmins.FieldByName('Donations')).DisplayFormat := '"R"0.00';

 tblSignups.Connection := conEcoverse;
 tblSignups.TableName := 'tblSignups';
 tblSignups.Open;

 tblEvents.Connection := conEcoverse;
 tblEvents.TableName := 'tblEvents';
 tblEvents.Open;

 qryUsers.Connection := conEcoverse;
 qryUsers.SQL.Add('SELECT * FROM tblUsers');
 qryUsers.Active := True;
 TFloatField(qryUsers.FieldByName('Donations')).DisplayFormat := '0.00';

 qryUsers2.Connection := conEcoverse;
 qryUsers2.SQL.Add('SELECT * FROM tblUsers');
 qryUsers2.Active := True;

 qryEvents.Connection := conEcoverse;
 qryEvents.SQL.Add('SELECT * FROM tblEvents');
 qryEvents.Active := True;

 dsrUsers.DataSet := qryUsers;
 dsrUsers2.DataSet := qryUsers2;
 dsrEvents.DataSet := qryEvents;
 dsrSignups.DataSet := tblSignups;
 dsrAdmins.DataSet := tblAdmins;

end;

end.
