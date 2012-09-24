unit fmOOSTakeBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, RzLabel, Mask, RzEdit,DataModule,
  RzCmboBx;

type
  TFormOOSTakeBalance = class(TForm)
    RzPanel1: TRzPanel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzNumericEdit1: TRzNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    CehList: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CehListChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzNumericEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _val: Extended;
    _ceh_id: integer;
    vallist: TStringList;
    idlist: TStringList;
  end;

var
  FormOOSTakeBalance: TFormOOSTakeBalance;

  function OOSTakeBalance(code_id:integer;year:word;var ceh_id:integer;var weight:real):boolean;

implementation

{$R *.dfm}

function OOSTakeBalance(code_id:integer;year:word;var ceh_id:integer;var weight:real):boolean;
begin
  ADOQueryExecute(CQuery,  ' select wc.name as name,src_dept_id,sum(weight) as weight from ws_waste_operation as wo'+
  ' left join ws_waste as ws on ws.id=wo.waste_id'+
  ' left join ws_company_dept as wc on wc.id=src_dept_id'+
  ' where wo.operation_id=0 and ws.code_id='+inttostr(code_id)+' and ws.year='+inttostr(year)+' group by src_dept_id,wc.name');

  if CQuery.IsEmpty then
  begin
    ShowErrorBox('Нет отсатков для распределения!');
    result := false;
    exit;
  end;

  FormOOSTakeBalance := TFormOOSTakeBalance.Create(nil);

  with FormOOSTakeBalance.CehList do
  begin
    Clear;
    AddItemValue('С прошлого года','0');
    FormOOSTakeBalance.vallist.Add(nz(CQuery.Lookup('src_dept_id',0,'weight'),0));
    FormOOSTakeBalance.idlist.Add('0');

    CQuery.Filter := 'src_dept_id<>0';
    CQuery.Filtered := true;
    
    CQuery.First;
    while not CQuery.Eof do
    begin
      FormOOSTakeBalance.vallist.Add(floattostr(nz(CQuery.FieldByName('weight').Value,0)));
      FormOOSTakeBalance.idlist.Add(CQuery.FieldByName('src_dept_id').AsString);
      AddItemValue(CQuery.FieldByName('name').AsString,CQuery.FieldByName('src_dept_id').AsString);
      CQuery.Next;
    end;
    ItemIndex := 0;
    OnChange(FormOOSTakeBalance.CehList);
  end;
  
  if FormOOSTakeBalance.ShowModal = mrOK then
  begin
    result :=  true;
    ceh_id := FormOOSTakeBalance._ceh_id;
    weight := FormOOSTakeBalance.RzNumericEdit1.Value;
  end else
    result := false;
  
  FormOOSTakeBalance.Free;
end;

procedure TFormOOSTakeBalance.CehListChange(Sender: TObject);
var
  id: string;
  i: integer;
begin
  id := CehList.Values[CehList.ItemIndex];
  i := idlist.IndexOf(id);
  _val := strtofloat(vallist[i]);
  _ceh_id := strtoint(id);
  RzLabel5.Caption := floattostr(_val);
end;

procedure TFormOOSTakeBalance.FormCreate(Sender: TObject);
begin
  vallist := TStringList.Create;
  idlist := TStringList.Create;
end;

procedure TFormOOSTakeBalance.FormShow(Sender: TObject);
begin
  RzNumericEdit1.SetFocus;
end;

procedure TFormOOSTakeBalance.RzButton1Click(Sender: TObject);
var
  v: Extended;
begin
  v := RzNumericEdit1.Value;
  if (v>_val+0.00001)
  or (v<=0)
  then
  begin
    ShowErrorBox('Невозможно взять это число из остатка!');
    exit;
  end;
  ModalResult := mrOK;
end;

procedure TFormOOSTakeBalance.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormOOSTakeBalance.RzNumericEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    ModalResult := mrCancel;

  if key = VK_RETURN then
    RzBUtton1.Click;
end;

end.
