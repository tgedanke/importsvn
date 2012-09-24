program conf_test;

uses
  Forms,
  fmTest in 'fmTest.pas' {Form4},
  uConf in 'uConf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
