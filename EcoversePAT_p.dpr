program EcoversePAT_p;

uses
  Vcl.Forms,
  UserLogin_u in 'UserLogin_u.pas' {frmUserLogin},
  UserHome_u in 'UserHome_u.pas' {frmUserHome},
  Registration_u in 'Registration_u.pas' {frmRegistration},
  AdminLogin_u in 'AdminLogin_u.pas' {frmAdminLogin},
  AdminHome_u in 'AdminHome_u.pas' {frmAdminHome},
  dbmEcoverseDB in 'dbmEcoverseDB.pas' {dmEcoverse: TDataModule},
  EventParticipants_u in 'EventParticipants_u.pas' {frmParticipants},
  clsCredentialValidation_u in 'clsCredentialValidation_u.pas',
  RecyclingTimetable_u in 'RecyclingTimetable_u.pas' {frmTimetable},
  EventSignUp_u in 'EventSignUp_u.pas' {frmSignup},
  Donations_u in 'Donations_u.pas' {frmDonations},
  Shop_u in 'Shop_u.pas' {frmShop},
  Host_u in 'Host_u.pas' {frmHost},
  Help_u in 'Help_u.pas' {frmHelp},
  ManageEvents_u in 'ManageEvents_u.pas' {frmManageEvents},
  Purchase_u in 'Purchase_u.pas' {frmPurchase},
  Logs_u in 'Logs_u.pas' {frmLogs},
  Reuse_u in 'Reuse_u.pas' {frmReuse},
  Info_u in 'Info_u.pas' {frmInfo},
  Recycle_u in 'Recycle_u.pas' {frmRecycle},
  Reduce_u in 'Reduce_u.pas' {frmReduce},
  EditAdminProfile_u in 'EditAdminProfile_u.pas' {frmEditProfile};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmUserLogin, frmUserLogin);
  Application.CreateForm(TfrmUserHome, frmUserHome);
  Application.CreateForm(TfrmRegistration, frmRegistration);
  Application.CreateForm(TfrmAdminLogin, frmAdminLogin);
  Application.CreateForm(TfrmAdminHome, frmAdminHome);
  Application.CreateForm(TdmEcoverse, dmEcoverse);
  Application.CreateForm(TfrmParticipants, frmParticipants);
  Application.CreateForm(TfrmTimetable, frmTimetable);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmDonations, frmDonations);
  Application.CreateForm(TfrmShop, frmShop);
  Application.CreateForm(TfrmHost, frmHost);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TfrmManageEvents, frmManageEvents);
  Application.CreateForm(TfrmPurchase, frmPurchase);
  Application.CreateForm(TfrmLogs, frmLogs);
  Application.CreateForm(TfrmReuse, frmReuse);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.CreateForm(TfrmRecycle, frmRecycle);
  Application.CreateForm(TfrmReduce, frmReduce);
  Application.CreateForm(TfrmEditProfile, frmEditProfile);
  Application.Run;
end.
