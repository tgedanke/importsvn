program updater;

uses
  Forms,
  fmMain in 'fmMain.pas' {Form2},
  uUpdater in 'uUpdater.pas',
  uConf in '..\_conf\uConf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
