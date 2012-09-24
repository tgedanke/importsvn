unit fmPabGetCeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzCmboBx, RzButton,
  DataModule;

type
  TFormPabGetCeh = class(TForm)
    RzPanel1: TRzPanel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzComboBox1: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPabGetCeh: TFormPabGetCeh;

function Pab_GetCeh(var ceh_id:integer):boolean;

implementation

{$R *.dfm}

function Pab_GetCeh(var ceh_id:integer):boolean;
begin
  result := false;
  FormPabGetCeh := TFormPabGetCeh.Create(nil);
  if FormPabGetCeh.ShowModal = mrOK then
  begin
    ceh_id := strtoint(FormPabGetCeh.RzComboBox1.Value);
    result := true;
  end;
  FormPabGetCeh.Free;
end;

procedure TFormPabGetCeh.FormCreate(Sender: TObject);
begin
  ADOQueryExecute(AQuery,'select * from pab_ceh_view order by name');
  with AQuery do
  while not EOF do
  begin
    RzComboBox1.AddItemValue(FieldByName('name').Value,inttostr(FieldByName('id').Value));
    Next;
  end;
  RzComboBox1.Value := '0';
end;

procedure TFormPabGetCeh.RzButton1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFormPabGetCeh.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
