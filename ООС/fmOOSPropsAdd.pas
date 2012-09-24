unit fmOOSPropsAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, RzLabel, RzCmboBx, Mask,
  RzEdit,DataModule,ADODB;

type
  TOOSPropContext = record
    year: integer;
    month_from, month_to: integer;
    id_property: integer;
    value: string;
  end;

  POOSPropContext = ^TOOSPropContext;

  TFormOOSPropsAdd = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    btnCancel: TRzBitBtn;
    btnSave: TRzBitBtn;
    edYear: TRzNumericEdit;
    edMF: TRzNumericEdit;
    edMT: TRzNumericEdit;
    edName: TRzComboBox;
    edValue: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    context: POOSPropContext;
  end;



function OOSPropsGetAddInfo(var addInfo:TOOSPropContext):boolean;
function OOSPropsGetEditInfo(var editInfo:TOOSPropContext):boolean;

implementation

{$R *.dfm}

function OOSPropsGetAddInfo(var addInfo:TOOSPropContext):boolean;
var
  form: TFormOOSPropsAdd;
  d,m,y: word;
begin
  form := TFormOOSPropsAdd.Create(nil);

  DecodeDate(Date,y,m,d);

  addInfo.year := y;
  addInfo.month_from := m;
  addInfo.month_to := m;
  addInfo.id_property := 0;
  addInfo.value := '';
  
  form.context := @addInfo;

  result := form.ShowModal = mrOK;
  
  form.Free;
end;

function OOSPropsGetEditInfo(var editInfo:TOOSPropContext):boolean;
var
  form: TFormOOSPropsAdd;
begin
  form := TFormOOSPropsAdd.Create(nil);
  form.context := @editInfo;
  
  result := form.ShowModal = mrOK;

  form.Free;
end;

procedure TFormOOSPropsAdd.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormOOSPropsAdd.btnSaveClick(Sender: TObject);
begin
  if edYear.Value < 2011 then
    raise Exception.Create('Выберите год');

  if (edMF.Value < 1) or (edMF.Value > 12) then
    raise Exception.Create('Выберите Месяц С');

  if (edMT.Value < 1) or (edMT.Value > 12) then
    raise Exception.Create('Выберите Месяц По');

  if edMF.Value > edMT.Value then
    raise Exception.Create('Месяц С должен быть меньше либо равен Месяц По');

  if edName.Value = '' then
    raise Exception.Create('Выберите свойство');

  context.year := edYear.IntValue;
  context.month_from := edMF.IntValue;
  context.month_to := edMT.IntValue;
  context.id_property := strtoint(edName.Value);
  context.value := edValue.Text;
  
  ModalResult := mrOK;
end;

procedure TFormOOSPropsAdd.FormShow(Sender: TObject);
var
  p: integer;
begin

  with DataModule1.newQuery do
  try
    SQL.Text := 'select * from ws_properties order by alias';
    Open;
    First;
    while not EOF do
    begin
      edName.AddItemValue(
        FieldByName('alias').AsString,
        FieldByName('id').AsString
      );
      Next;
    end;
  finally
    Free;
  end;

  edYear.IntValue := context.year;
  edMF.IntValue := context.month_from;
  edMT.IntValue := context.month_to;
  
  if edName.Values.IndexOf(inttostr(context.id_property)) >= 0 then
    edName.Value := inttostr(context.id_property);

  edValue.Text := context.value;
end;

end.
