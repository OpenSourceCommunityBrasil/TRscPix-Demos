program ClientRscPix;

uses
  Forms,
  View.FrmMain in '..\Source\View\View.FrmMain.pas' {FrmMain},
  client.Utils in '..\Comum\client.Utils.pas';

{$R *.res}

begin
  Application.Title :=  'RscPix - Roniery Santos Cardoso - 92 4141-2737';
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
