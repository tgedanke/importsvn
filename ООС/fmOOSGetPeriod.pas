unit fmOOSGetPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzButton, ExtCtrls, RzPanel, RzLabel,DataModule,
  DB, Mask, DBCtrlsEh, ADODB, DBCtrls, RzDBCmbo;

type
  TFormOOSGetPeriod = class(TForm)
    RzPanel1: TRzPanel;
    RzButton1: TRzButton;
    RzComboBox1: TRzComboBox;
    RzComboBox2: TRzComboBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzButton2: TRzButton;
    qryCeh: TADOQuery;
    dsCeh: TDataSource;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzComboBox3: TRzComboBox;
    RzLabel3: TRzLabel;
    procedure RzComboBox3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOOSGetPeriod: TFormOOSGetPeriod;

  function OOSGetPeriod(var year:word;var quarter:word):boolean;
  function OOSGetPeriodCeh(var year:word;var quarter:word;var ceh:integer;var otch:integer):boolean;
implementation

{$R *.dfm}

function OOSGetPeriod(var year:word;var quarter:word):boolean;
begin
  result := false;
  FormOOSGetPeriod := TFormOOSGetPeriod.Create(nil);
  FormOOSGetPeriod.Height := 122;
  FormOOSGetPeriod.RzDBLookupComboBox1.Visible := false;
  FormOOSGetPeriod.RzComboBox3.Visible := false;
  if FormOOSGetPeriod.ShowModal=mrOK then
  begin
    year := strtoint(FormOOSGetPeriod.RzComboBox1.Value);
    quarter := strtoint(FormOOSGetPeriod.RzComboBox2.Value);
    result := true;
  end;
  FormOOSGetPeriod.Free;
end;

function OOSGetPeriodCeh(var year:word;var quarter:word;var ceh:integer;var otch:integer):boolean;
begin
  result := false;
  FormOOSGetPeriod := TFormOOSGetPeriod.Create(nil);
  FormOOSGetPeriod.Height := 178;
  FormOOSGetPeriod.RzDBLookupComboBox1.Visible := false;
  FormOOSGetPeriod.RzLabel3.Visible := true;
  FormOOSGetPeriod.RzComboBox3.Visible := true;
  if FormOOSGetPeriod.ShowModal=mrOK then
  begin
    year := strtoint(FormOOSGetPeriod.RzComboBox1.Value);
    quarter := strtoint(FormOOSGetPeriod.RzComboBox2.Value);
    ceh := nz(FormOOSGetPeriod.RzDBLookupComboBox1.KeyValue,0);
    otch := FormOOSGetPeriod.RzComboBox3.ItemIndex;
    result := true;
  end;
  FormOOSGetPeriod.Free;
end;

procedure TFormOOSGetPeriod.FormCreate(Sender: TObject);
var
  y,m,d:word;
begin
  DecodeDate(Date,y,m,d);
  RzComboBox1.Value := inttostr(y);
  RzComboBox2.Value := inttostr(round(m/3));
  RzDBLookupComboBox1.InitKeyValue;
end;

procedure TFormOOSGetPeriod.RzComboBox3Change(Sender: TObject);
begin
if (FormOOSGetPeriod.RzComboBox3.ItemIndex=1) or (FormOOSGetPeriod.RzComboBox3.ItemIndex=2) then
   FormOOSGetPeriod.RzDBLookupComboBox1.Visible := true
else FormOOSGetPeriod.RzDBLookupComboBox1.Visible := false;
end;

end.
