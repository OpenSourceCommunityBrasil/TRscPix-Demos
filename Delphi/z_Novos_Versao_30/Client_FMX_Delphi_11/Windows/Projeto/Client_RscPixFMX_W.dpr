program Client_RscPixFMX_W;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.FrmMain in '..\Source\view\View.FrmMain.pas' {FrnMain},
  ClientFMX.Utils in '..\..\Comum\ClientFMX.Utils.pas';

{$R *.res}

begin

  Application.Title :=  'RSCPIX - FMX WINDOWS - By: Roniery Santos Cardoso  - 92 4141-2737';

  Application.Initialize;
  Application.CreateForm(TFrnMain, FrnMain);
  Application.Run;
end.
