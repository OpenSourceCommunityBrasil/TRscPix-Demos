program DemoTRscPixVCL;
uses
  Vcl.Forms,
  uFrmMain in 'View\uFrmMain.pas' {FrmMain},
  DelphiZXIngQRCode in '..\..\Extra\DelphiZXIngQRCode.pas',
  uRsc.Vcl.funcoes in '..\..\Extra\uRsc.Vcl.funcoes.pas';

{$R *.res}
begin
  ReportMemoryLeaksOnShutdown :=  True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
