unit rSummary;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;

procedure Report_Summary_Build(year:word;quarter:byte);

implementation

type
 TCeh = record
   id:integer;
   name: string;
 end;

 TNorm = record
   k: real;
   p: real;
 end;

procedure Report_Summary_Build(year:word;quarter:byte);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data: Variant;
  rowid,realrow,codeid: integer;
  v:real;
  code,dept: string;
  clas: integer;
  i: integer;
  cehmap : array[0..15] of TCeh;

  cehcount: integer;
  normative: array[0..5] of TNorm;

  s_k_razm: string;
  k_razm: double;
begin

  sql := 'select * from ws_view_report_summary where [year]='+inttostr(year)+' and [quarter]='+inttostr(quarter);

  ADOQueryExecute(AQuery,sql);

  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;

  sql := 'select code_id,sum(weight) as weight from ws_view_report_summary where [year]='
      +inttostr(year)+' and [quarter]<='+inttostr(quarter)+' group by code_id';
  ADOQueryExecute(CQuery,sql);

  sql := 'select distinct src_dept_id,src_dept from ws_view_report_summary where [year]='
      +inttostr(year)+' and [quarter]='+inttostr(quarter)+' order by src_dept';
  ADOQueryExecute(BQuery,sql);

  cehcount := 0;
  while not BQuery.EOF do
  begin
    cehmap[cehcount].id := BQuery.FieldByName('src_dept_id').Value;
    cehmap[cehcount].name := BQuery.FieldByName('src_dept').Value;
    inc(cehcount);
    BQuery.Next;
  end;

  sql := 'select * from ws_normative where [year]='+inttostr(year);
  ADOQueryExecute(BQuery,sql);

  with BQuery do
  if not EOF then
    for i := 1 to 5 do
    begin
      normative[i].k := nz(FieldByName('c'+inttostr(i)+'_infl').Value,0);
      normative[i].p := nz(FieldByName('c'+inttostr(i)+'_norm').Value,0);
    end;


  sql := 'select distinct code,code_id,class,waste,limit from ws_view_report_summary where [year]='
  +inttostr(year)+' and [quarter]='+inttostr(quarter)+' order by waste';
  ADOQueryExecute(BQuery,sql);

  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\oos\сводный по отходам.xlt');
  e.Show;

  e.SetActiveSheet('данные');
  e.CellsB['B4'].Value := FormatDateTIme('dd.mm.yyyy',Date());
  e.CellsB['B1'].Value := inttostr(quarter)+' квартал '+inttostr(year)+' г.';
  e.SetActiveSheet(1);
  e.InsertRows(6,BQuery.RecordCount-1);
  data := VarArrayCreate([0,BQuery.RecordCount-1,0,25],varVariant);

  s_k_razm := DataModule1.GetPropertyValue(year,(quarter-1)*3+1,'full.report.25');
  
  if s_k_razm = '' then
    k_razm := 1
  else
    k_razm := StrToFloat(s_k_razm);


  for i := 0 to 15 do
  begin
    if i<cehcount then
      e.Cells[10+i,4].Value := cehmap[i].name
    else
      e.Sheet.Columns[10+i].Hidden := true;
  end;


  sql := 'select [code],sum([weight]) as [weight] from waste_view_report_summary where'+
        ' [year]='+inttostr(year)+' and [quarter]<='+inttostr(quarter)+
        ' group by [code]';


  BQuery.First;
  rowid := 0;

  while not BQuery.EOF do
  with BQuery do
  begin
      realrow := rowid+7;
      code := nz(FieldByName('code').Value,'');
      codeid := nz(FieldByName('code_id').Value,0);
      clas := nz(FieldByName('class').Value,0);
      data[rowid,0] := '=ROW()-6';
      data[rowid,1] := round3(nz(FieldByName('waste').Value,''));
      data[rowid,2] := clas;
      data[rowid,3] := nz(FieldByName('limit').Value,'0');
      data[rowid,4] := '=SUM(J'+inttostr(realrow)+':W'+inttostr(realrow)+')';
      data[rowid, 5] := nz(CQuery.Lookup('code_id',codeid,'weight'),0);
      data[rowid, 6] := normative[clas].p;
      data[rowid,7] := normative[clas].k;
      data[rowid,8] := k_razm;

      //data[rowid,6..13] := dept;
      for i := 0 to cehcount-1 do
      begin
        v := round3(nz(AQuery.Lookup('code_id;src_dept_id',VarArrayOf([codeid,cehmap[i].id]),'weight'),0));
        if v<>0 then
          data[rowid,9+i] := v
        else
          data[rowid,9+i] := '';
      end;
    inc(rowid);
    Next;
  end;

  
  e.Range('A',7,'Z',7+BQuery.RecordCount-1).Value := data;
  VarClear(data);

  e.Free;
end;

end.
