unit fmProtocolNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, RzLabel, DBCtrls, RzDBCmbo,
  ComCtrls, RzDTP, Mask, RzEdit, RzDBEdit, Grids, DBGrids, RzDBGrid,
  DataModule, fmAddNPA,DB, ADODB, RzDBDTP, RzDBNav,
  report, ActnList, RzRadChk, RzDBChk, fmInputList, RzCmboBx;

type
  TProtocolClose = procedure(sender:TForm) of object;
  
  TFormProtocolNew = class(TForm)
    PanelBottom: TRzPanel;
    PanelBottomButtons: TRzPanel;
    ButtonSave: TRzButton;
    ButtonClose: TRzButton;
    RzPanel1: TRzPanel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzDBGrid1: TRzDBGrid;
    RzButton1: TRzButton;
    dsProtocol: TDataSource;
    protocol: TADOTable;
    protocolid: TAutoIncField;
    protocolodate: TDateTimeField;
    protocolpredpriatie_id: TIntegerField;
    protocoluchastok_id: TIntegerField;
    protocolprof_id: TIntegerField;
    protocolpost_id: TIntegerField;
    RzDBDateTimePicker1: TRzDBDateTimePicker;
    dsPredpritatie: TDataSource;
    predpriatie: TADOQuery;
    dsUchastok: TDataSource;
    uchastok: TADOQuery;
    profession: TADOQuery;
    dsProfession: TDataSource;
    dolgnost: TADOQuery;
    dsDolgnost: TDataSource;
    dsProtocolnsd: TDataSource;
    protocolnsd: TADOQuery;
    nsd: TADOQuery;
    dsNsd: TDataSource;
    protocolnsdid: TAutoIncField;
    protocolnsdprotocol_id: TIntegerField;
    protocolnsdnum: TIntegerField;
    protocolnsdsort: TIntegerField;
    protocolnsdnsd_id: TIntegerField;
    protocolnsdpunkt_id: TIntegerField;
    protocolnsdtext: TStringField;
    protocolnsdNsd: TStringField;
    dsPunkt: TDataSource;
    punkt: TADOQuery;
    protocolnsdPunkt: TStringField;
    RzDBNavigator1: TRzDBNavigator;
    RzLabel11: TRzLabel;
    protocolnsdtool_id: TIntegerField;
    dsTools: TDataSource;
    tools: TADOQuery;
    protocolnsdTool: TStringField;
    number: TADOQuery;
    dsnumber: TDataSource;
    protocolnsdRazdel: TStringField;
    ScrollBox1: TScrollBox;
    RzPanel8: TRzPanel;
    RzPanel12: TRzPanel;
    RzLabel13: TRzLabel;
    protocolattestator_id: TIntegerField;
    RzDBEdit1: TRzDBEdit;
    RzLabel14: TRzLabel;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    RzDBGrid3: TRzDBGrid;
    proverili: TADOTable;
    dsProverili: TDataSource;
    proveriliid: TAutoIncField;
    proverilipredpriatie_id: TIntegerField;
    proverilirabotnik_id: TIntegerField;
    proveriliprotocol_id: TIntegerField;
    dsRabotnik: TDataSource;
    rabotnik: TADOQuery;
    proveriliRabotnik: TStringField;
    RzDBNavigator3: TRzDBNavigator;
    RzLabel15: TRzLabel;
    RzDBGrid4: TRzDBGrid;
    RzDBNavigator4: TRzDBNavigator;
    predstaviteli: TADOTable;
    dspredstaviteli: TDataSource;
    predstaviteliid: TAutoIncField;
    predstaviteliprotocol_id: TIntegerField;
    predstavitelirabotnik_id: TIntegerField;
    predstavitelipredpriatie_id: TIntegerField;
    predstaviteliRabotnik: TStringField;
    RzLabel16: TRzLabel;
    RzPanel14: TRzPanel;
    RzLabel17: TRzLabel;
    RzButton3: TRzButton;
    ChildActionList: TActionList;
    Refresh: TAction;
    RzDBCheckBox1: TRzDBCheckBox;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzDBCheckBox2: TRzDBCheckBox;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzDBCheckBox3: TRzDBCheckBox;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzDBCheckBox4: TRzDBCheckBox;
    RzLabel25: TRzLabel;
    protocolsootv1: TBooleanField;
    protocolsootv2: TBooleanField;
    protocolsootv3: TBooleanField;
    protocolsootv4: TBooleanField;
    RzLabel26: TRzLabel;
    protocoluslovia_class: TIntegerField;
    dsUsloviaclass: TDataSource;
    usloviaclass: TADOTable;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    RzButton2: TRzButton;
    AddNpaClose: TAction;
    AddResNpaClose: TAction;
    RzDBGrid5: TRzDBGrid;
    RzDBNavigator5: TRzDBNavigator;
    RzLabel27: TRzLabel;
    dsOtvetsvtennii: TDataSource;
    Otvetstvenii: TADOTable;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    proveriliotvetstvennii: TSmallintField;
    Otvetstveniiotvetstvennii: TSmallintField;
    RzButton4: TRzButton;
    ADOCommand1: TADOCommand;
    addOborCommand: TADOCommand;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    professionid: TAutoIncField;
    professionname: TStringField;
    protocolnum: TStringField;
    RzDBEdit2: TRzDBEdit;
    professioncode: TStringField;
    protocolcode: TStringField;
    RzDBEdit3: TRzDBEdit;
    RzLabel2: TRzLabel;
    protocolprof_comment: TStringField;
    RzDBLookupComboBox7: TRzDBLookupComboBox;
    protocolproveril_rabotnik_id: TIntegerField;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OtvetstveniiNewRecord(DataSet: TDataSet);
    procedure AddNpaCloseExecute(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure RzPanel14Click(Sender: TObject);
    procedure RzDBGrid4Enter(Sender: TObject);
    procedure predstaviteliNewRecord(DataSet: TDataSet);
    procedure RzDBGrid3Enter(Sender: TObject);
    procedure proveriliNewRecord(DataSet: TDataSet);
    procedure RzButton3Click(Sender: TObject);
    procedure tresultNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
    procedure RzDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsProtocolnsdDataChange(Sender: TObject; Field: TField);
    procedure protocolnsdNewRecord(DataSet: TDataSet);
    procedure dsProtocolDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure protocolNewRecord(DataSet: TDataSet);
    procedure RzButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzPanel4Click(Sender: TObject);
    procedure RzPanel5Click(Sender: TObject);
    procedure RzDateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FProtocolClose: TProtocolClose;
    needcalcsootv: boolean;
  public
    { Public declarations }
    procedure ProtocolEdit(id:integer);
    property OnProtocolClose:TProtocolClose read FProtocolClose write FProtocolClose;
    procedure CalcSootv;
  end;

var
  FormProtocolNew: TFormProtocolNew;
  height1,height2,height3,height4 : integer;
  protocol_id : integer;
  sootv1_post : boolean = false;
implementation

{$R *.dfm}



procedure TFormProtocolNew.ProtocolEdit(id:integer);
var
  pred_id, uch_id: integer;
begin
  protocol.Cancel;
  protocol.Filter := '[id] = ' + inttostr(id);
  protocol.Filtered := true;
  protocol_id := id;

  protocolnsd.SQL.Text := 'select *,(select num from tb_nsd_punkt as a where a.nsd_id = b.nsd_id and a.id = b.punkt_id) as punkt_num from tb_protocol_nsd as b where protocol_id = '
  + inttostr(protocol_id)+' order by num asc,text desc,tool_id asc,nsd_id asc,punkt_num asc';
  protocolnsd.Active := true;



  tools.Sort := 'name ASC';

  RzPanel4.Enabled := true;
  RzPanel14.Enabled := true;

  pred_id := protocol.FieldByName('predpriatie_id').Value;
  uch_id := protocol.FieldByName('uchastok_id').Value;
  RzDBLookupComboBox2.Enabled := true;
  uchastok.Filter := '[predpriatie_id]='+inttostr(pred_id);
  uchastok.Filtered := true;
  RzDBLookupComboBox2.KeyValue := uch_id;
  RzDBLookupComboBox2.InitKeyValue;
  RzDBLookupComboBox2.KeyValue := uch_id;

  RzButton1.Caption := 'Применить';
end;

procedure TFormProtocolNew.AddNpaCloseExecute(Sender: TObject);
begin
  nsd.Requery();
  protocolnsd.Requery();
  needcalcsootv := true;
end;

procedure TFormProtocolNew.Button1Click(Sender: TObject);
begin
  proverili.Filter := 'otvetstvenii=0';
  proverili.Filtered := true;
end;

procedure TFormProtocolNew.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormProtocolNew.ButtonSaveClick(Sender: TObject);
begin
  try
  protocol.Post;
  except
    on E:Exception do begin end;
  end;
end;

procedure TFormProtocolNew.dsProtocolDataChange(Sender: TObject; Field: TField);
var
  pid : integer;
begin
  if (Field = nil) or varisnull(Field.Value) then exit;

if Field.FieldName = 'predpriatie_id' then
begin
  if varisnull(Field.Value) or (Field.Value=0) then
  begin
    pid := 0;
    RzDBLookupComboBox2.Field.Clear;
    RzDBLookupComboBox2.Enabled := false;
  end else
  begin
    pid := Field.Value;
    RzDBLookupComboBox2.Field.Clear;
    RzDBLookupComboBox2.Enabled := true;
  end;
  //uchastok.Filter := '[predpriatie_id] = '+ inttostr(pid);
  if (protocol.FieldByName('uchastok_id') <> nil) and (protocol.FieldByName('uchastok_id').Value <> null) then
      uchastok.Seek('[uchastok_id]='+inttostr(protocol.FieldByName('uchastok_id').Value))
  else
    uchastok.First;
  exit;
end;

if Field.FieldName = 'prof_id' then
begin
  protocol.FieldByName('code').Value := nz(profession.Lookup('id',Field.Value,'code'),'0');
end;

  
end;

procedure TFormProtocolNew.dsProtocolnsdDataChange(Sender: TObject;
  Field: TField);
var
  f : TField;
  id : integer;
begin

  if (Field <> nil) and (Field.FieldName = 'nsd_id') then
  begin
    //punkt.SQL.Text := 'select id,num from tb_nsd_punkt where nsd_id = '+inttostr(Field.Value)+' order by num';
    //punkt.Active := true;
    punkt.Filter := 'nsd_id = '+inttostr(f.Value);
    punkt.Filtered := true;
    protocolnsd.FieldByName('punkt_id').Clear;
    protocolnsd.FieldByName('punkt_id').Value := 0;
    exit;
  end;

  if (Field <> nil) and (Field.Fieldname = 'punkt_id') then exit;
  
  f := protocolnsd.FieldByName('nsd_id');

  if (f <> nil) then
  begin
    //punkt.SQL.Text := 'select id,num from tb_nsd_punkt where nsd_id = '+inttostr(f.Value)+' order by num';
    //punkt.Active := true;
    id := nz(f.Value,0);
    punkt.Filter := 'nsd_id = '+inttostr(id);
    punkt.Filtered := true;
  end;
  
end;

procedure TFormProtocolNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if assigned(FProtocolClose) then
  try
    FProtocolClose(nil);
  except

  end;
  FProtocolClose := nil;
end;

procedure TFormProtocolNew.FormCreate(Sender: TObject);
begin
  protocol.Insert;
end;

procedure TFormProtocolNew.FormDestroy(Sender: TObject);
begin
  if protocol.State in [dsEdit] then
    protocol.Post;
end;

procedure TFormProtocolNew.FormShow(Sender: TObject);
var
  i: integer;
begin
  protocol_id := 0;
  height1 := RzPanel1.Height;
  height3 := RzPanel3.Height;
  height4 := RzPanel12.Height;


  RzPanel3.Height := 0;
  RzPanel12.Height := 0;
  RzPanel4.Enabled := false;
  RzPanel14.Enabled := false;


  if not varisnull(protocol.FieldByName('id').Value) then
  begin
  protocol_id := protocol.FieldByName('id').Value;
  protocolnsd.SQL.Text := 'select *,(select num from tb_nsd_punkt as a where a.nsd_id = b.nsd_id and a.id = b.punkt_id) as punkt_num from tb_protocol_nsd as b where protocol_id = '
  + inttostr(protocol_id)+' order by num asc,text desc,tool_id asc,nsd_id asc,punkt_num asc';
  protocolnsd.Active := true;

  end;


  tools.Sort := 'name ASC';

  needcalcsootv := true;

end;

procedure TFormProtocolNew.OtvetstveniiNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName('protocol_id').Value := protocol_id;
  Dataset.FieldByName('predpriatie_id').Value := protocol.FieldByName('attestator_id').Value;
  Dataset.FieldByName('otvetstvennii').Value := 1;
end;

procedure TFormProtocolNew.predstaviteliNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName('protocol_id').Value := protocol_id;
  Dataset.FieldByName('predpriatie_id').Value := protocol.FieldByName('predpriatie_id').Value;
end;

procedure TFormProtocolNew.protocolNewRecord(DataSet: TDataSet);
var
  num : Variant;
  s,s1,s2: string;
  n: integer;
  nn: string;
begin
  dataset.FieldByName('odate').Value := DateToStr(Date());
  num := GetSingleSQLResult('select max(num) from tb_protocol where year(odate) = year(getdate())',0);

  s := nz(num,'0');
  nn := '';
  
  if pos('-',s) > 0 then
  begin
    try
      n := strtoint(copy(s,pos('-',s)+1,20));
    except
       try
          n := strtoint(copy(s,1,pos('-',s)-1));
       except
          n := 0;
       end;
    end;
  end else
  begin
    try
      n := strtoint(s);
    except
      n := 0;
    end;
  end;

  if n<>0 then
    nn := inttostr(n+1)
  else
    nn := s+'*';
    
  dataset.FieldByName('num').Value := nn;

  dataset.FieldByName('code').Value := '0';
  dataset.FieldByName('predpriatie_id').Value := 0;
  dataset.FieldByName('uchastok_id').Value := 0;
  RzDBLookupComboBox2.Enabled := false;
end;

procedure TFormProtocolNew.protocolnsdNewRecord(DataSet: TDataSet);
begin
  dataset.FieldByName('protocol_id').Value := protocol_id;
  dataset.FieldByName('num').Value := 1;
  dataset.FieldByName('sort').Value := 0;
end;

procedure TFormProtocolNew.proveriliNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName('protocol_id').Value := protocol_id;
  Dataset.FieldByName('predpriatie_id').Value := protocol.FieldByName('attestator_id').Value;
  Dataset.FieldByName('otvetstvennii').Value := 0;
end;

procedure TFormProtocolNew.RefreshExecute(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount-1 do
  if (Components[i].ClassName = 'TADOQuery') or (Components[i].ClassName = 'TADOTable') then
  if Components[i] <> TComponent(protocol) then
  begin
    if Components[i].ClassName = 'TADOQuery' then
      TADOQuery(Components[i]).Requery();
    if Components[i].ClassName = 'TADOTable' then
      TADOTable(Components[i]).Requery();
  end;

  {predpriatie.Requery();
  uchastok.Requery();
  profession.Requery();
  dolgnost.Requery();
  nsd.Requery();
  punkt.Requery();
  rabotnik.Requery();}
end;

procedure TFormProtocolNew.RzBitBtn1Click(Sender: TObject);
begin
  protocol.Edit;
  protocol.FieldByName('prof_id').Value := null;
  protocol.FieldByName('code').Value := '0';
end;

procedure TFormProtocolNew.RzBitBtn2Click(Sender: TObject);
begin
  protocol.Edit;
  protocol.FieldByName('post_id').Value := null;
end;

procedure TFormProtocolNew.RzButton1Click(Sender: TObject);
begin
  if protocol_id <> 0 then
  begin
    protocol.Edit;
    protocol.Post;
    exit;
  end;

  try
    protocol.Post;
    protocol_id := protocol.FieldByName('id').Value;
    RzPanel4.Enabled := true;
    RzPanel14.Enabled := true;
    RzButton1.Enabled := false;

    protocolnsd.SQL.Text := 'select *,(select num from tb_nsd_punkt as a where a.nsd_id = b.nsd_id and a.id = b.punkt_id) as punkt_num from tb_protocol_nsd as b where protocol_id = '
    + inttostr(protocol_id)+' order by num asc,text desc,tool_id asc,nsd_id asc,punkt_num asc';
    protocolnsd.Active := true;

  finally

  end;
end;

procedure TFormProtocolNew.RzButton2Click(Sender: TObject);
begin
  fmAddNPA.protocol_id := protocol_id;
  fmAddNPA.razd_num := 1;
  OpenChildForm(TForm(Owner),TFormAddNPA,TForm(FormAddNPA));
  FormAddNPA.closeaction := AddNpaClose;
end;

procedure TFormProtocolNew.RzButton3Click(Sender: TObject);
var
  r : TTBReport;
  date, num, code,post,dolgn,predpr,podrazd,
    attest,tmp,tmp2,tmp3,tmp4,tmp5,uslovia_class,uslovia_dopust, p_comm : string;
  query: TADOQuery;
  i: integer;
  sootv: array[1..4] of integer;
  last_nsd_name: string;
  sel_msg: WideString;
  pid,did: integer;
  pr_id,at_id,cnt: integer;
  count: integer;
begin

  try
    protocol.Post;
  except

  end;

  CalcSootv;
  
  query := TADOQuery.Create(FormProtocolNew);
  query.Connection := DataModule1.KMCConnection;

  date := protocol.FieldByName('odate').Value;
  num := protocol.FieldByName('num').Value;
  code := nz(protocol.FieldByName('code').Value,'');

  pid := nz(protocol.FieldByName('prof_id').Value,0);
  did := nz(protocol.FieldByName('post_id').Value,0);
  p_comm := nz(protocol.FieldByName('prof_comment').Value,'');

  if pid <> 0 then
    post := GetSingleSQLResult('select name from tb_profession where id='+inttostr(pid),'');
  if did <> 0 then
    dolgn := GetSingleSQLResult('select name from tb_post where id='+inttostr(did),'');

  if post = '' then
  begin
    post := dolgn;
  end else
  if dolgn<>'' then
    post := dolgn + ', ' + post;

  post := post+p_comm;

  pr_id := 0;
  at_id := 0;
  
  if (protocol.FieldByName('predpriatie_id')<>nil) and (not varisnull(protocol.FieldByName('predpriatie_id').Value)) then
  begin
     i := protocol.FieldByName('predpriatie_id').Value;
     predpr := GetSingleSQLResult('select name from tb_predpriatie where id='+inttostr(i),'');
     pr_id := i;
  end else predpr := '';

  if (protocol.FieldByName('attestator_id')<>nil) and (not varisnull(protocol.FieldByName('attestator_id').Value)) then
  begin
     i := protocol.FieldByName('attestator_id').Value;
     attest := GetSingleSQLResult('select name from tb_predpriatie where id='+inttostr(i),'');
     at_id := i;
  end else attest := '';

  if (uchastok.FieldByName('name')<> nil) and (not varisnull(uchastok.FieldByName('name').Value)) then
    podrazd := uchastok.FieldByName('name').Value else podrazd := '';

  if predpr = '' then
  begin
    predpr := podrazd;
  end else
  if podrazd<>'' then
    predpr := predpr + ', ' +podrazd;

  sootv[1] := protocol.FieldByName('sootv1').Value*-1;
  sootv[2] := protocol.FieldByName('sootv2').Value*-1;
  sootv[3] := protocol.FieldByName('sootv3').Value*-1;
  sootv[4] := protocol.FieldByName('sootv4').Value*-1;

  if protocol.FieldByName('uslovia_class')<> nil then
    uslovia_class := inttostr(protocol.FieldByName('uslovia_class').Value) else uslovia_class := '0';

  if uslovia_class = '1' then uslovia_dopust := 'оптимальные';
  if uslovia_class = '2' then uslovia_dopust := 'допустимые';
  if uslovia_class = '3' then uslovia_dopust := 'вредные';



    
  r := TTBReport.Create;
  r.DisableScreenUpdating;
  r.Show;


  //// Punkt 9
 { query.SQL.Text := 'select b.name as rabotnik,c.name as predpriatie,d.name as post '+
  'from tb_protocol_proverili as a '+
  'join tb_predpriatie_rabotnik as b '+
  'on b.id = a.rabotnik_id '+
  'join tb_predpriatie as c '+
  'on a.predpriatie_id = c.id '+
  'join tb_post as d '+
  'on b.post_id = d.id '+
  'where a.protocol_id='+inttostr(protocol_id)+' and a.otvetstvennii=1 '+
  'order by rabotnik asc';

  query.Active := true;
  while not query.eof do
  begin
    tmp := nz(query.FieldByName('rabotnik').Value,'');
    tmp2 := nz(query.FieldByName('predpriatie').Value,'');
    tmp3 := nz(query.FieldByName('post').Value,'');
    if pr_id = at_id then
      tmp2 := tmp3
    else
      tmp2 := tmp3 + ', ' + tmp2;
    r.AddP9(tmp2,tmp);
    query.Next;
  end;
  r.FinishP9;    }
  
  /// Punkt 8
 { query.SQL.Text := 'select b.name as rabotnik,c.name as predpriatie,d.name as post '+
  'from tb_protocol_predstaviteli as a '+
  'join tb_predpriatie_rabotnik as b '+
  'on b.id = a.rabotnik_id '+
  'join tb_predpriatie as c '+
  'on a.predpriatie_id = c.id '+
  'join tb_post as d '+
  'on b.post_id = d.id '+
  'where a.protocol_id='+inttostr(protocol_id)+' order by rabotnik asc';

  query.Active := true;
  while not query.eof do
  begin
    tmp := nz(query.FieldByName('rabotnik').Value,'');
    tmp2 := nz(query.FieldByName('predpriatie').Value,'');
    tmp3 := nz(query.FieldByName('post').Value,'');
    if pr_id = at_id then
      tmp2 := tmp3
    else
      tmp2 := tmp3 + ', ' + tmp2;
    r.AddP8(tmp2,tmp);
    query.Next;
  end;
  r.FinishP8;  }

  // Punkt 7



  {
  query.SQL.Text := 'select b.name as rabotnik,c.name as predpriatie,d.name as post '+
  'from tb_protocol_proverili as a '+
  'join tb_predpriatie_rabotnik as b '+
  'on b.id = a.rabotnik_id '+
  'join tb_predpriatie as c '+
  'on a.predpriatie_id = c.id '+
  'join tb_post as d '+
  'on b.post_id = d.id '+
  'where a.protocol_id='+inttostr(protocol_id)+' and a.otvetstvennii=0 ' +
  'order by rabotnik asc';

  query.Active := true;
  while not query.eof do
  begin
    tmp := nz(query.FieldByName('rabotnik').Value,'');
    tmp2 := nz(query.FieldByName('predpriatie').Value,'');
    tmp3 := nz(query.FieldByName('post').Value,'');
    if pr_id = at_id then
      tmp2 := tmp3
    else
      tmp2 := tmp3 + ', ' + tmp2;
    r.AddP7(tmp2,tmp);
    query.Next;
  end;
  r.FinishP7;
  }


  query.SQL.Text := 'select b.name as rabotnik,c.name as predpriatie,d.name as post '+
  'from tb_protocol as a '+
  'join tb_predpriatie_rabotnik as b '+
  'on b.id = a.proveril_rabotnik_id '+
  'join tb_predpriatie as c '+
  'on a.predpriatie_id = c.id '+
  'join tb_post as d '+
  'on b.post_id = d.id '+
  'where a.id='+inttostr(protocol_id)+' ' +
  'order by rabotnik asc';

  query.Active := true;
  while not query.eof do
  begin
    tmp := nz(query.FieldByName('rabotnik').Value,'');
    tmp2 := nz(query.FieldByName('predpriatie').Value,'');
    tmp3 := nz(query.FieldByName('post').Value,'');
    if pr_id = at_id then
      tmp2 := tmp3
    else
      tmp2 := tmp3 + ', ' + tmp2;
    r.AddP7(tmp2,tmp);
    query.Next;
  end;
  r.FinishP7;


  // Punkt 6
  
  r.AddP6Usloviya('Условия труда на рабочем месте относятся к классу '
    +uslovia_class+' - '+uslovia_dopust);

  for i := 1 to 4 do
  begin
    cnt := GetSingleSQLResult('select count(*) from ' +
      'tb_protocol_nsd as a ' +
      'join tb_nsd as b on a.nsd_id = b.id ' +
      'left outer join tb_nsd_punkt as c on a.punkt_id = c.id '+
      'where a.protocol_id = ' +inttostr(protocol_id)+ ' and a.num = '+ inttostr(i)
      ,0
    );

    if cnt = 0 then sootv[i] := 2;
    
    tmp := GetSingleSQLResult(
      'select [text] from tb_result_sootv where [num]='+inttostr(i)+
      ' and [sootv]='+inttostr(sootv[i])
      ,'');
    r.AddP6(' - '+tmp);
    query.SQL.Text := 'select b.num,b.description,c.name from tb_protocol_nsd as a,tb_nsd_punkt as b,tb_nsd as c'+
    ' where a.protocol_id='+inttostr(protocol_id)+
    ' and a.num='+inttostr(i)+' and (a.nsd_id is not null) '+
    ' and d_sootv=0 and b.nsd_id = a.nsd_id and b.id = a.punkt_id and c.id = a.nsd_id order by c.name,b.num asc';
    query.Active := true;
    query.First;
    while not query.Eof do
    begin
      tmp := nz(query.FieldByName('num').Value,'') +' ' +nz(query.FieldByName('name').Value,'');
      r.AddP6(' * '+tmp,false);
      query.Next;
    end;
    query.Active := false;
  end;


  r.FinishP6;


  for i := 1 to 4 do
  begin
  query.SQL.Text := 'select b.name as nsd_name,c.num as punkt_num,c.description as punkt_desc, '+
  'a.d_sost, a.d_mer,(select name from tb_ocenka where tb_ocenka.id = isnull(a.d_sootv,0) ) as ocenka from ' +
  'tb_protocol_nsd as a ' +
  'join tb_nsd as b on a.nsd_id = b.id ' +
  'left outer join tb_nsd_punkt as c on a.punkt_id = c.id '+
  'where a.protocol_id = ' +inttostr(protocol_id)+ ' and a.num = '+ inttostr(i)+
  ' order by nsd_name,punkt_num' ;

  query.Active := true;

  last_nsd_name := '';

  if query.RecordCount = 0 then
  begin
    tmp := GetSingleSQLResult('select text from tb_result_sootv where num='+inttostr(i)+' and sootv=2','');
    if i = 1 then
      r.AddTBOborudovanie(
      tmp,
      '',
      '',
      '',0
      )
    else if i = 2 then
      r.AddTBInstrument(
      tmp,
      '',
      '',
      '',0
      )
    else if i = 3 then
      r.AddTBInstruktag(
      tmp,
      '',
      '',
      '',0
      )
    else if i = 4 then
      r.AddTBBezopasnost(
      tmp,
      '',
      '',
      '',0
      );
    continue;
  end;
  
  while not query.eof do
  begin
    tmp := nz(query.FieldByName('nsd_name').Value,'');
    tmp2 := nz(query.FieldByName('punkt_num').Value,'');
    tmp3 := nz(query.FieldByName('punkt_desc').Value,'');
    tmp4 := nz(query.FieldByName('d_sost').Value,'');
    tmp5 := nz(query.FieldByName('d_mer').Value,'');

    if tmp = last_nsd_name then
    begin
      sel_msg := '';
      if (tmp2<>'') and (tmp3<>'') then
      begin
        tmp := tmp2 + '   ' + tmp3;
      end else
        tmp := tmp3;
    end else
    begin
      last_nsd_name := tmp;
      sel_msg := tmp;
      if (tmp2<>'') and (tmp3<>'') then
      begin
        tmp := tmp + #13#10 + tmp2 + '   ' + tmp3;
      end;
    end;

    tmp := strreplace(#13,'',tmp);
    tmp4 := strreplace(#13,'',tmp4);
    tmp5 := strreplace(#13,'',tmp5);
    tmp2 := nz(query.FieldByName('ocenka').Value,'');

    if (tmp2='Соответствует') and (tmp4='') then
    begin
      tmp4 := 'Выполняется';
    end;
    
    if i = 1 then
      r.AddTBOborudovanie(
      tmp,
      tmp4,
      tmp2,
      tmp5,length(sel_msg)
      )
    else if i = 2 then
      r.AddTBInstrument(
      tmp,
      tmp4,
      tmp2,
      tmp5,length(sel_msg)
      )
    else if i = 3 then
      r.AddTBInstruktag(
      tmp,
      tmp4,
      tmp2,
      tmp5,length(sel_msg)
      )
    else if i = 4 then
      r.AddTBBezopasnost(
      tmp,
      tmp4,
      tmp2,
      tmp5,length(sel_msg)
      );

    query.Next;
  end;

  end;

  // Protocol #
  r.ReplaceMask(2,1,'#',num);
    
  r.ShapeByNameSetText('data_ocenki',date);
  r.ShapeByNameSetText('code',code);
  r.ShapeByNameSetText('post',post);
  r.ShapeByNameSetText('predpriatie',predpr);
  r.ShapeByNameSetText('attestator',attest);

  // NSD po OT
  for i:=4 downto 1 do
  begin
  // tools
  count := 0;

  query.SQL.Text := 'select distinct b.name as tool_name from tb_protocol_nsd as a'+
  ' join tb_tool as b on a.tool_id = b.id where a.protocol_id='+ inttostr(protocol_id) +
  ' and a.num=' + inttostr(i) + ' and '+
  '(a.nsd_id is null or a.nsd_id = 0) and (a.tool_id is not null and a.tool_id <> 0)';
  query.Active := true;
  count := count + query.RecordCount;
  while not query.Eof do
  begin
    r.AddP1_4(i,' - ' + query.FieldByName('tool_name').Value);
    query.Next;
  end;

  // other
  query.SQL.Text := 'select distinct text from tb_protocol_nsd where '+
  'protocol_id='+ inttostr(protocol_id) +' and num=' + inttostr(i) + ' and (nsd_id is null or nsd_id = 0)'+
  ' and (tool_id is null or tool_id = 0)';
  query.Active := true;
  count := count + query.RecordCount;
  while not query.Eof do
  begin
    r.AddP1_4(i,' - ' + query.FieldByName('text').Value);
    query.Next;
  end;

  // nsd
  query.SQL.Text := 'select b.name as nsd_name,b.description as nsd_desc from tb_protocol_nsd as a'+
  ' join tb_nsd as b on a.nsd_id = b.id where a.protocol_id='+ inttostr(protocol_id) +
  ' and a.num=' + inttostr(i) + ' and (a.nsd_id is not null and a.nsd_id<>0) and a.id in ' +
  '(select min(id) from tb_protocol_nsd where num='+ inttostr(i) +' group by protocol_id,nsd_id)';
  query.Active := true;
  count := count + query.RecordCount;
  while not query.Eof do
  begin
    tmp := ' - ' + query.FieldByName('nsd_name').Value;
    if (query.FieldByName('nsd_desc')<> nil) and (not varisnull(query.FieldByName('nsd_desc').Value)) then
    begin
      tmp := tmp + ', ' + query.FieldByName('nsd_desc').Value;
    end;
    r.AddP1_4(i,tmp);
    query.Next;
  end;

  if count = 0 then
    r.AddP1_4(i,' - отсутствует');


  end;

  query.Free;

  r.EnableScreenUpdating;
end;


procedure TFormProtocolNew.RzButton4Click(Sender: TObject);
var
  s: string;
  oid: TList;
  rid,i: integer;
begin
  oid := TList.Create;
  if InputOborudovanie(oid,rid) then
  begin
    for i := 0 to oid.Count- 1 do
    begin
      addOborCommand.Parameters.ParamValues['pid'] := protocol_id;
      addOborCommand.Parameters.ParamValues['num'] := rid;
      addOborCommand.Parameters.ParamValues['tool'] := integer(oid[i]);
      addOborCommand.Execute;
    end;
    protocolnsd.Requery();
  end;
  oid.Free;
end;

procedure TFormProtocolNew.RzDateTimePicker1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    FormProtocolNew.SelectNext(TWinControl(Sender),true,true);
  end;
end;

procedure TFormProtocolNew.RzDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DELETE then
  begin
    if RzDBGrid1.SelectedField.FieldName = 'Nsd' then
    begin
      protocolnsd.Edit;
      protocolnsd.FieldByName('Nsd').Clear;
      protocolnsd.FieldByName('nsd_id').Value := 0;
      protocolnsd.FieldByName('Punkt').Clear;
      protocolnsd.FieldByName('punkt_id').Value := 0;
    end;

    if RzDBGrid1.SelectedField.FieldName = 'Punkt' then
    begin
      protocolnsd.Edit;
      protocolnsd.FieldByName('punkt_id').Value := 0;
      protocolnsd.FieldByName('Punkt').Clear;
    end;

    if RzDBGrid1.SelectedField.FieldName = 'Tool' then
    begin
      protocolnsd.Edit;
      protocolnsd.FieldByName('tool_id').Value := 0;
      protocolnsd.FieldByName('Tool').Clear;
    end;

  end;
end;

procedure TFormProtocolNew.RzDBGrid3Enter(Sender: TObject);
begin
  rabotnik.Filter := '[predpriatie_id] = '+inttostr(protocol.FieldByName('attestator_id').Value);
  rabotnik.Filtered := true;
end;

procedure TFormProtocolNew.RzDBGrid4Enter(Sender: TObject);
begin
  rabotnik.Filter := '[predpriatie_id] = '+inttostr(protocol.FieldByName('predpriatie_id').Value);
  rabotnik.Filtered := true;
end;

procedure TFormProtocolNew.RzPanel14Click(Sender: TObject);
begin
  RzPanel12.Height := height4;
  RzPanel1.Height := 0;
  RzPanel3.Height := 0;
  CalcSootv;
end;

procedure TFormProtocolNew.RzPanel4Click(Sender: TObject);
begin
  RzPanel3.Height := height3;
  RzPanel1.Height := 0;
  RzPanel12.Height := 0;
end;

procedure TFormProtocolNew.RzPanel5Click(Sender: TObject);
begin
  RzPanel1.Height := height1;
  RzPanel3.Height := 0;
  RzPanel12.Height := 0;
end;

procedure TFormProtocolNew.tresultNewRecord(DataSet: TDataSet);
begin
  dataset.FieldByName('protocol_id').Value := protocol_id;
  dataset.FieldByName('sub_id').Value := 1;
  dataset.FieldByName('ocenka_id').Value := 1;
end;

procedure TFormProtocolNew.CalcSootv;
var
  i,n: integer;
begin
  if not needcalcsootv then exit;

  for i := 1 to 4 do
  begin
    n := GetSingleSQLResult('select count(*) from tb_protocol_nsd where protocol_id='+inttostr(protocol_id)+
    ' and num='+inttostr(i)+' and (nsd_id is not null) and d_sootv=0 ',0);
    if n>0 then n := 0 else n := 1;
    
    ExecSQLQuery('update tb_protocol set sootv'+inttostr(i)+'='+inttostr(n)+' where id='+inttostr(protocol_id));
  end;

  protocol.Active := false;
  protocol.Active := true;
  //protocol.Requery();
  //dsProtocol.DataSet.Refresh;
  needcalcsootv := false;
end;

end.
