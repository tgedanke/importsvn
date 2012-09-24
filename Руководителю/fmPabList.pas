unit fmPabList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, RzPanel, DB, ADODB,
  DataModule, RzButton, StdCtrls, RzLabel, RzCmboBx, RzDBCmbo, DBCtrls, RzRadChk;

type
  TFormPabList = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    DBGridEh1: TDBGridEh;
    qryPab: TADOQuery;
    dsPab: TDataSource;
    BtnPabNew: TRzButton;
    BtnPabDel: TRzButton;
    BtnPabSign: TRzButton;
    RzPanel3: TRzPanel;
    RzButton1: TRzButton;
    ViewCombo: TRzComboBox;
    RzLabel1: TRzLabel;
    StatusCombo: TRzComboBox;
    RzLabel2: TRzLabel;
    qryCeh: TADOQuery;
    dsCeh: TDataSource;
    CehCombo: TRzDBLookupComboBox;
    RzLabel3: TRzLabel;
    RzButton2: TRzButton;
    YearCombo: TRzComboBox;
    RzLabel4: TRzLabel;
    cbMonth2: TRzCheckBox;
    procedure cbMonth2Click(Sender: TObject);
    procedure YearComboChange(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure CehComboCloseUp(Sender: TObject);
    procedure StatusComboChange(Sender: TObject);
    procedure ViewComboChange(Sender: TObject);
    procedure qryPabAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure BtnPabSignClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure BtnPabDelClick(Sender: TObject);
    procedure BtnPabNewClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    RIGHTS_SQL: string;
    CURRENT_YEAR: string;
    MONTH2: boolean;
    
    procedure UpdateViewType(t:integer);
    procedure ShowFields(const f:array of string);

    procedure UpdateFIlter;
  public
    { Public declarations }
  end;

  procedure PabListRefresh;

var
  FormPabList: TFormPabList;

implementation

uses fmMain,fmPabAdd;
{$R *.dfm}

procedure PabListRefresh;
begin
  try
    FormPabList.qryPab.Requery();
  except
  end;
end;



function InArray(v:string;const a:array of string):boolean;
var
  i: integer;
begin
  result := true;
  for i:=0 to length(a)-1 do
  if a[i]=v then exit;
  result := false;
end;

procedure TFormPabList.ShowFields(const f:array of string);
var
  i: integer;
begin
  with   DBGridEh1.Columns  do
  for I := 0 to Count-1 do
    begin
      if
        InArray(lowercase(Items[i].FieldName),f)
      then
        Items[i].Visible := true
      else
        Items[i].Visible := false;

    end;
end;

procedure TFormPabList.StatusComboChange(Sender: TObject);
begin
  UpdateFilter;
end;

procedure TFormPabList.UpdateFIlter;
var
  f: string;
  d,m,y: word;
begin

  DecodeDate(date,y,m,d);
  
  if m<2 then
    m := 1
  else
    m := m - 1;
    
  if (YearCombo.Value<>CURRENT_YEAR) or (MONTH2<>cbMonth2.Checked) then
  begin
    if YearCombo.Value<>'0' then
    begin
      qrypab.Close;
      qrypab.SQL.Text := 'select * from pab_main_view where ('+ RIGHTS_SQL +') and [year]='+YearCombo.Value;
      if cbMonth2.Checked then
        qrypab.SQL.Text := qrypab.SQL.Text + ' and [month]>='+_i(m);
      
      qrypab.SQL.Text := qrypab.SQL.Text + ' order by [num] desc';
      qrypab.Open;
    end else
    begin
      qrypab.Close;
      qrypab.SQL.Text := 'select * from pab_main_view where '+ RIGHTS_SQL + ' order by [num] desc';
      qrypab.Open;
    end;

    CURRENT_YEAR := YearCombo.Value;
    MONTH2 := cbMonth2.Checked;
  end;
  
  f := 'id>0';
  if nz(StatusCombo.Value,'0')<>'0' then
  begin
    if StatusCombo.Value='4' then
    begin
      f := f+ ' and locked=0 or locked=3';  
    end else
      f := f+ ' and locked='+StatusCombo.Value;
  end;

  if nz(CehCombo.KeyValue,0)<>0 then
  begin
    f := f+ ' and cehid='+inttostr(CehCombo.KeyValue);
  end;

  qryPab.Filter := f;
  qrypab.Filtered := true;
end;

procedure TFormPabList.UpdateViewType(t:integer);

begin
  with   DBGridEh1.Columns  do
  case t of
  1:
  begin
    ShowFields(['num','date','ceh','uchastok','count','tester','category','boss_decision']);        
  end;
  2:
  begin
    ShowFields(['num','date','time_start','time_end','ceh',
                'uchastok','count','tester','tester_post',
                'category','boss_decision','type','fatal_effect','audit_kind',
                'work_kind','danger_description','possible_effect','worker_idea']);
  end;

  11:
  begin
    ShowFields(['num','date','ceh','uchastok','count','category','boss_decision']);
  end;
  12:
  begin
    ShowFields(['num','date','time_start','time_end','ceh',
                'uchastok','count',
                'category','boss_decision','type','fatal_effect','audit_kind',
                'work_kind','danger_description','possible_effect','worker_idea']);
  end;

  end;
end;

procedure TFormPabList.ViewComboChange(Sender: TObject);
begin
  UpdateViewType(strtoint(ViewCombo.Value));
end;

procedure TFormPabList.YearComboChange(Sender: TObject);
begin
  UpdateFilter;
end;

procedure TFormPabList.BtnPabDelClick(Sender: TObject);
begin
  if qryPab.EOF then exit;
  if varisnull(qryPab.FieldByName('id').Value) then exit;
  ExecSQLQuery('delete from pab_main where id='+inttostr(qryPab.FieldByName('id').Value));
  qrypab.Requery();
end;

procedure TFormPabList.BtnPabNewClick(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormPabAdd,TForm(FormPabAdd));
  FormPabAdd.NewPortocol;
end;

procedure TFormPabList.DBGridEh1DblClick(Sender: TObject);
begin

  if (qrypab.Eof and qrypab.IsEmpty) or varisnull(qryPab.FieldByName('id').Value) then
  begin
    ShowErrorBox('Не выбран ПАБ!');
    exit;
  end;
  
  OpenChildForm(FormMain,TFormPabAdd,TForm(FormPabAdd));

  FormPabAdd.OpenProtocol(qryPab.FieldByName('id').Value);

end;

procedure TFormPabList.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  l: integer;
begin
  l := nz(Column.Field.DataSet.FieldByName('locked').Value,0);
  if l=1 then
  begin
    Background := $00C0FFFF;
  end else
  if l=2 then
  begin
    Background := $00C0FFC0;
  end else
  if l=3 then
  begin
    Background := $00C0C0FF;
  end else
  if l=0 then
  begin
    Background := $00FFFFFF;
  end;
end;

procedure TFormPabList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormPabList.FormCreate(Sender: TObject);
var
  ceh: integer;
  show_ceh,show_self,show_all: boolean;
  sql: string;
  d,m,y: word;
begin
  ceh := UserGetCeh;

  qrypab.Active := false;

  show_ceh := false;
  show_self := false;
  show_all := false;

  show_ceh := show_ceh or IsUserBoss;
  show_self := IsUserBOss or IsUserUser or IsUserViewAll;
  show_all := IsUserViewAll;

  sql := '1=0';
  if show_ceh then
  begin
    if ceh = 0 then raise Exception.Create('Неверно настроены права (группа НАЧ.ЦЕХА, но не указан цех)! Обратитесь к администратору.');
    // выбираем пабы за текущий цех, которые на согласование(1) или уже согласованы(2)
    sql := sql+' or ((isnull(locked,0)<>0) and (isnull(locked,0)<>3) and (cehid='+inttostr(ceh)+')) ';
  end;

  if show_all then
  begin
    // выбираем все пабы  на согласование(1) или уже согласованы(2)
    sql := ' ((isnull(locked,0)<>0) and (isnull(locked,0)<>3)) ';
  end;

  if show_self then
  begin
    // выбираем пабы для текущего пользователя
    sql := sql+' or ([owner]='''+UserAccount+''') ';
  end;


  if length(sql)<5 then
  begin
    raise Exception.Create('Неверные права доступа! Обратитесь к администратору.');
  end;

  RIGHTS_SQL := sql;

  DecodeDate(Date,y,m,d);

  CURRENT_YEAR := inttostr(y);
  MONTH2 := True;
  
  if m<2 then
    m := 1
  else
    m := m - 1;

  qrypab.SQL.Text := 'select * from pab_main_view where ('+ sql +') and [year]='+_i(y)+ ' and [month]>='+_i(m)+' order by [num] desc';

  qrypab.Active := true;


  
  YearCombo.Value := inttostr(y);

  if IsUserBoss or IsUserViewAll then
  begin
    ViewCombo.AddItemValue('Краткий','1');
    ViewCombo.AddItemValue('Полный','2');
    ViewCombo.ItemIndex := 0;
    UpdateViewType(1);
  end else
  if IsUserUser then
  begin
    ViewCombo.AddItemValue('Краткий','11');
    ViewCombo.AddItemValue('Полный','12');
    ViewCombo.ItemIndex := 0;
    UpdateViewType(11);
  end;
  
end;

procedure TFormPabList.FormShow(Sender: TObject);
begin
  if qrypab.Active=false then close;
  CehCombo.KeyValue := 0;
  UpdateFilter;
end;

procedure TFormPabList.qryPabAfterScroll(DataSet: TDataSet);
var
  locked: integer;
  can_del,can_sign: boolean;
  owner: string;
begin
  locked := nz(dataset.FieldByName('locked').Value,0);
  owner := nz(dataset.FieldByName('owner').Value,'');

  can_del := false;
  can_sign := false;
{
  if (locked<>0) and (locked<>3) then
  begin
    BtnPabDel.Visible := false;
    BtnPabSign.Visible := false;
  end else
  begin
    BtnPabDel.Visible := true;
    BtnPabSign.Visible := true;
  end;
}

  if (owner = UserAccount)and(locked<>2)and(locked<>1) then
  begin
    can_del := true;
  end;

  if (owner = UserAccount) and ((locked=0) or (locked=3))then
  begin
    can_sign := true;
  end;
  
  BtnPabDel.Visible := can_del;
  BtnPabSign.Visible := can_sign;

end;

procedure TFormPabList.RzButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPabList.RzButton2Click(Sender: TObject);
begin
  qryPab.Requery();
end;

procedure TFormPabList.BtnPabSignClick(Sender: TObject);
begin
  if (qrypab.Eof and qrypab.IsEmpty) or varisnull(qryPab.FieldByName('id').Value) then
  begin
    ShowErrorBox('Не выбран ПАБ!');
    exit;
  end;

  if IDNO = MessageBox(Handle,'После этой операции ПАБ станет недоступен для изменения. Хотите продолжить?','Подтверждение',MB_YESNO or MB_ICONQUESTION) then exit;

  Boss_Sign(qryPab.FieldByName('id').Value);
end;

procedure TFormPabList.cbMonth2Click(Sender: TObject);
begin
  UpdateFIlter;
end;

procedure TFormPabList.CehComboCloseUp(Sender: TObject);
begin
  UpdateFilter;
end;

end.
