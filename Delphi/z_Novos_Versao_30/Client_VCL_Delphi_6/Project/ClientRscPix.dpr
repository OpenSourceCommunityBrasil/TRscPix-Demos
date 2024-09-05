program ClientRscPix;

uses
  Forms,
  ViewFrmMain in '..\Source\View\ViewFrmMain.pas' {FrmMain},
  clientUtils in '..\Source\clientUtils.pas';

{$R *.res}

begin
  Application.Title :=  'RscPix - Roniery Santos Cardoso - 92 4141-2737';
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
