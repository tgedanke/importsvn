unit fmOOSAddOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, RzDBCmbo, RzPanel, ExtCtrls, RzRadGrp, RzDBRGrp, RzButton,
  DataModule, DB, ADODB, StdCtrls, Mask, RzEdit, RzDBEdit, RzCmboBx;

type
  TFormOOSAddOper = class(TForm)
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzGroupBox2: TRzGroupBox;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBRadioGroup1: TRzDBRadioGroup;
    RzGroupBox3: TRzGroupBox;
    RzButton1: TRzButton;
    dsOper: TDataSource;
    tblOper: TADOTable;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzButton2: TRzButton;
    tblSrcComp: TADOTable;
    dsSrcComp: TDataSource;
    tblSrcDept: TADOTable;
    dsSrcDept: TDataSource;
    tblDstComp: TADOTable;
    dsDstComp: TDataSource;
    dsDstDept: TDataSource;
    tblDstDept: TADOTable;
    RzButton3: TRzButton;
    RzGroupBox4: TRzGroupBox;
    edMonth: TRzComboBox;
    procedure edMonthChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsOperDataChange(Sender: TObject; Field: TField);
    procedure RzButton3Click(Sender: TObject);
    procedure RzDBNumericEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RzDBNumericEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOOSAddOper: TFormOOSAddOper;

  procedure OOSAddOper(waste_id:integer);
  procedure OOSEditOper(oper_id:integer);
implementation

{$R *.dfm}

  uses fmOOSTakeBalance;


procedure OOSAddOper(waste_id:integer);
var
  code_id: integer;
begin
   ///
   FormOOSAddOper := TFormOOSAddOper.Create(nil);

   FormOOSAddOper.tblOper.Active := true;
   FormOOSAddOper.tblOper.Insert;
   FormOOSAddOper.tblOper.FieldByName('waste_id').Value := waste_id;
   FormOOSAddOper.tblOper.FieldByName('operation_id').Value := 0;
   FormOOSAddOper.tblOper.FieldByName('src_company_id').Value := 5;
   FormOOSAddOper.tblOper.FieldByName('month').Value := GetSingleSQLResult('select quarter from ws_waste where id='+inttostr(waste_id),0)*3;

   code_id := GetSingleSQLResult('select code_id from ws_waste where id='+inttostr(waste_id),0);

   case code_id of

   3061,3064,3070,3098:
   begin
   ///пхп 3,9
    FormOOSAddOper.tblOper.FieldByName('dst_company_id').Value := 3;
    FormOOSAddOper.tblOper.FieldByName('dst_dept_id').Value := 9;
   end;

   2744,3312,2873,3315,3317,3320,3321,2777,3304,2646,3319:
   begin
   ///ЦШП 3,12
    FormOOSAddOper.tblOper.FieldByName('dst_company_id').Value := 3;
    FormOOSAddOper.tblOper.FieldByName('dst_dept_id').Value := 12;
   end;

   3209,3308,3309,3310,2560:
   begin
   ///природоохран 6
   FormOOSAddOper.tblOper.FieldByName('dst_company_id').Value := 6;
   end;

   2585,3322,3318,2674,2741,2694,2715,2679:
   begin
   ///цбио
    FormOOSAddOper.tblOper.FieldByName('dst_company_id').Value := 3;
    FormOOSAddOper.tblOper.FieldByName('dst_dept_id').Value := 15;
   end;

   2859,2868,2902,2910,2922,2991,2999,3001,3009:
   begin
   ///ФЛЦ    5,39
      FormOOSAddOper.tblOper.FieldByName('dst_company_id').Value := 5;
      FormOOSAddOper.tblOper.FieldByName('dst_dept_id').Value := 39;
   end;

   end;
   
   FormOOSAddOper.ShowModal;
   FormOOSAddOper.Free;
end;

procedure OOSEditOper(oper_id:integer);
begin
  ///
   FormOOSAddOper := TFormOOSAddOper.Create(nil);
   
   FormOOSAddOper.tblOper.Active := true;
   
   if not FormOOSAddOper.tblOper.Locate('id',inttostr(oper_id),[loPartialKey]) then
   begin
    FormOOSAddOper.Free;
    raise Exception.Create('Отход не найден!');
   end;

   FormOOSAddOper.tblOper.Edit;

   FormOOSAddOper.ShowModal;
   FormOOSAddOper.Free;
end;

procedure TFormOOSAddOper.dsOperDataChange(Sender: TObject; Field: TField);
begin
  if (Field=nil) then exit;

  if (Field.FieldName='operation_id') and (nz(Field.Value,0)=3) then
  if nz(tblOper.FieldByName('dst_company_id').Value,0)=0 then
  begin
    tblOper.FieldByName('dst_company_id').Value := 3;
    tblOper.FieldByName('dst_dept_id').Value := 15;
  end;
end;

procedure TFormOOSAddOper.edMonthChange(Sender: TObject);
begin
  if edMonth.ItemIndex = 0 then
    tblOper.FieldByName('month').Value := NULL
  else
    tblOper.FieldByName('month').Value := edMonth.ItemIndex;
end;

procedure TFormOOSAddOper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblOper.Cancel;
end;

procedure TFormOOSAddOper.FormShow(Sender: TObject);
begin
  edMonth.ItemIndex := nz(tblOper.FieldByName('month').Value,0);
end;

procedure TFormOOSAddOper.RzButton1Click(Sender: TObject);
begin
  tblOper.Cancel;
  ModalResult := mrCancel;
end;

procedure TFormOOSAddOper.RzButton2Click(Sender: TObject);
begin
  tblOper.Post;
  ModalResult := mrOK;
end;

procedure TFormOOSAddOper.RzButton3Click(Sender: TObject);
var
  id,year,code_id,ceh_id: integer;
  r: real;
begin
  id := tblOper.FieldByName('waste_id').Value;
  ADOQueryExecute(queries[0],'select [year],[code_id] from ws_waste where id='+inttostr(id));
  if queries[0].EOF then
  begin
    raise Exception.Create('Не могу найти отход!');
  end;

  year :=  queries[0].FieldByname('year').Value;
  code_id := queries[0].FieldByname('code_id').Value;
  

  if not OOSTakeBalance(code_id,year,ceh_id,r) then exit;

  tblOper.FieldByName('weight').Value := nz(tblOper.FieldByName('weight').Value,0)+r;

  ExecSQLQuery('insert into ws_waste_operation(waste_id,src_company_id,src_dept_id,operation_id,weight) values('+
    inttostr(id)+','+
    inttostr(nz(tblOper.FieldByName('src_company_id').Value,0))+','+
    inttostr(ceh_id{nz(tblOper.FieldByName('src_dept_id').Value,0)})+','+
    '0,'+
    my_floattostr(-r)+
  ')');

end;

procedure TFormOOSAddOper.RzDBNumericEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Ord('.') then
  begin
    RzDBNumericEdit1.Text := RzDBNumericEdit1.Text+',';
  end;
end;

procedure TFormOOSAddOper.RzDBNumericEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key='.' then
  key := ',';
end;

end.
