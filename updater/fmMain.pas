unit fmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, uUpdater;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  updater: TUpdater;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  BUtton1.Enabled := false;
  Updater.UpdateAll;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'Проект';
  StringGrid1.Cells[1,0] := 'Версия';
  StringGrid1.Cells[2,0] := 'Новая версия';
  updater := TUpdater.Create;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i: integer;
begin
  if updater.NeedUpdate then Button1.Enabled := true;
  
  StringGrid1.RowCount :=  updater.Projects.Count+1;
  for I := 0 to updater.Projects.Count - 1 do
  begin
    StringGrid1.Cells[0,i+1] := updater.Projects[i];
    StringGrid1.Cells[1,i+1] := updater.CurrentVersions[i];
    StringGrid1.Cells[2,i+1] := updater.NewVersions[i];
  end;
end;

end.
