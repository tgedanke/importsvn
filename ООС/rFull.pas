unit rFull;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;

procedure Report_Full_Build(year:word;quarter:byte);

implementation

type
  TWasteInfo=record
    w_total: real;
    w_razm: real;
    w_razm_increment: real;
    w_other: real;
    w_ispol: real;
    w_obezvr:real;
    w_peredano: real;
    n_plati: real;
    k_limit: real;
    k_eco: real;
    k_infl: real;
  end;

var
  qry: array[0..9] of TADOQuery;
  
procedure GetWasteInfo_init(year:word;quarter:word);
var
  i: integer;
  sql0,sql: string;
begin
  for I := 0 to 9 do
  begin
    qry[i] := TADOQuery.Create(nil);
    qry[i].Connection := DataModule.DataModule1.KMCConnection;
  end;

  sql0 := 'select [code_id],sum(weight) as weight from ws_view_report where year='+inttostr(year)+' and src_company_id=5 ';//''ООО "ССМ-Тяжмаш"''

  sql := sql0+ ' and quarter='+inttostr(quarter)+' and operation_id=1 group by [code_id]';//''для использования''
  qry[0].SQL.Text := sql;
  qry[0].Active := true;

  sql := sql0+ ' and quarter='+inttostr(quarter)+' and operation_id=2 group by [code_id]';//''для обезвреживания''

  qry[1].SQL.Text := sql;
  qry[1].Active := true;

  sql := sql0+ ' and quarter='+inttostr(quarter)+' and operation_id=3 group by [code_id]';//''для захоронения''
  qry[2].SQL.Text := sql;
  qry[2].Active := true;

  sql := sql0+ ' and quarter='+inttostr(quarter)+' and operation_id=4 group by [code_id]';//''для переработки''
  qry[3].SQL.Text := sql;
  qry[3].Active := true;

  sql := sql0+ ' and quarter='+inttostr(quarter)+' and operation_id=5 group by [code_id]';//''перед. др. орг. с прав. собств.''
  qry[4].SQL.Text := sql;
  qry[4].Active := true;

  sql := sql0+ ' and quarter='+inttostr(quarter)+' and operation_id>=0 group by [code_id]';
  qry[5].SQL.Text := sql;
  qry[5].Active := true;


  sql := 'select [code_id],sum(weight) as weight from ws_view_report where year='+inttostr(year)+' and src_company_id<>5 ';//''ООО "ССМ-Тяжмаш"''
  sql := sql + ' and quarter='+inttostr(quarter)+' and operation_id>0 group by [code_id]';
  qry[6].SQL.Text := sql;
  qry[6].Active := true;


  sql := 'select * from ws_normative where '+
  'year='+inttostr(year);
  qry[8].SQL.Text := sql;
  qry[8].Active := true;

  sql := 'select * from ws_codes_year_view where '+
  'year='+inttostr(year);
  qry[9].SQL.Text := sql;
  qry[9].Active := true;


  sql := sql0+ ' and quarter<='+inttostr(quarter)+' and operation_id=3 group by [code_id]';//''для захоронения''
  qry[7].SQL.Text := sql;
  qry[7].Active := true;

end;

procedure GetWasteInfo_fin;
var
  i: integer;
begin
  for I := 0 to 9 do
  begin
    qry[i].free;
  end;
end;

procedure GetWasteInfo(code_id:integer;var r:TWasteInfo);
var
  clas: integer;
begin
  r.w_total := nz(qry[5].Lookup('code_id',code_id,'weight'),0);
  r.w_razm := nz(qry[2].Lookup('code_id',code_id,'weight'),0);
  r.w_razm_increment := nz(qry[7].Lookup('code_id',code_id,'weight'),0);
  r.w_ispol := nz(qry[0].Lookup('code_id',code_id,'weight'),0)+nz(qry[3].Lookup('code_id',code_id,'weight'),0);
  r.w_obezvr := nz(qry[1].Lookup('code_id',code_id,'weight'),0);
  r.w_peredano := nz(qry[4].Lookup('code_id',code_id,'weight'),0);

  clas :=  nz(qry[9].Lookup('code_id',code_id,'class'),0);

  if (clas>=1) and (clas<=5) then
  begin
    r.n_plati := nz(qry[8].FieldByName('c'+inttostr(clas)+'_norm').Value,0);
    r.k_infl := nz(qry[8].FieldByName('c'+inttostr(clas)+'_infl').Value,0);
  end else
  begin
    r.n_plati := 0;
    r.k_infl := 0;
  end;
  r.w_other := nz(qry[6].Lookup('code_id',code_id,'weight'),0);

  r.k_limit := 5;
  r.k_eco := 1.4;
end;

function snz(v:Variant):String;
begin
  result := VarToStr(v);
  if result = '0' then result :='';
end;

function fnz(v:Variant):String;
var
  f: real;
begin
  f := nz(v,0);
  if f = 0 then result :=''
  else
    result := my_floattostr(f);
end;

procedure Report_Full_Build(year:word;quarter:byte);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data,data2: Variant;
  rowid,realrow,realrow2: integer;
  code: string;
  code_id: integer;
  clas: integer;
  limit,weight,weight_over,weight_inc,weight_over_inc: real;
  info: TWasteInfo;
  s_k_razm: string;
  k_razm: double;
begin

  sql :=
' select distinct'+
' [code_id],[code],[class],[waste],max(limit) as limit,sum(weight) as weight'+
' from ws_view_report as w '+
' where '+
' [year]='+inttostr(year)+' and '+
' [quarter]<='+inttostr(quarter)+
' group by '+
' [code_id],[code],'+
' [class],'+
' [waste]'+
' order by [class],[waste]';

  ADOQueryExecute(BQuery,sql);

  sql :=
' select distinct'+
' [code_id],[code],[class],[waste],sum(weight) as weight'+
' from ws_view_report as w '+
' where '+
' [year]='+inttostr(year)+' and '+
' [quarter]='+inttostr(quarter)+
' group by '+
' [code_id],[code],'+
' [class],'+
' [waste]'+
' order by [class],[waste]';

  ADOQueryExecute(AQuery,sql);
  
  if BQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;

  s_k_razm := DataModule1.GetPropertyValue(year,(quarter-1)*3+1,'full.report.25');
  
  if s_k_razm = '' then
    k_razm := 1
  else
    k_razm := StrToFloat(s_k_razm);

  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\oos\полный отчет.xlt');
  e.Show;

  e.SetActiveSheet('1-14');
  e.InsertRows(21,BQuery.RecordCount-1);

  data := VarArrayCreate([0,BQuery.RecordCount-1,0,13],varVariant);
  data2 := VarArrayCreate([0,BQuery.RecordCount-1,0,13],varVariant);

  
  BQuery.First;
  rowid := 0;

  GetWasteInfo_init(year,quarter);
  
  while not BQuery.EOF do
  with BQuery do
  begin
      realrow := rowid+22;
      realrow2 := rowid+8;

      code := nz(FieldByName('code').Value,'');
      code_id := nz(FieldByName('code_id').Value,0);
      clas := nz(FieldByName('class').Value,0);
      limit := nz(FieldByName('limit').Value,'0');

      GetWasteInfo(code_id,info);

      weight := info.w_razm;

      if weight>limit then
      begin
        weight_over := weight-limit;
        weight := limit;
      end else
      begin
        weight_over := 0;
      end;

      weight_inc := info.w_razm_increment;

      if weight_inc>limit then
      begin
        weight_over_inc := weight_inc-limit;
        weight_inc := limit;
      end else
      begin
        weight_over_inc := 0;
      end;

      data[rowid,0] := '=ROW()-21';
      data[rowid,1] := nz(FieldByName('waste').Value,'');
      data[rowid,2] := code;
      data[rowid,3] := '';
      data[rowid,4] := snz(clas);
      data[rowid,5] := fnz(limit);
      data[rowid,6] := fnz(weight_inc);
      data[rowid,7] := fnz(weight_over_inc);
      data[rowid,8] := fnz(info.w_total);

      data[rowid,9] := fnz(info.w_other);

      data[rowid,10] := fnz(info.w_ispol);
      data[rowid,11] := fnz(info.w_obezvr);
      data[rowid,12] := fnz(info.w_peredano);


      data2[rowid,0] := fnz(weight+weight_over);
      data2[rowid,1] := fnz(weight);
      data2[rowid,2] := fnz(weight_over);;
      data2[rowid,3] := '';
      data2[rowid,4] := info.n_plati;  // 19
      data2[rowid,5] := info.k_limit;
      data2[rowid,6] := info.k_eco;
      data2[rowid,7] := '';
      data2[rowid,8] := info.k_infl;
      data2[rowid,9] := k_razm;
      if info.w_razm<>0 then
      begin
        data2[rowid,10] := '=B'+inttostr(realrow2)+'*E'+inttostr(realrow2)+'*G'+inttostr(realrow2)+'*I'+inttostr(realrow2)+'*J'+inttostr(realrow2);
        data2[rowid,11] := '=C'+inttostr(realrow2)+'*E'+inttostr(realrow2)+'*F'+inttostr(realrow2)+'*G'+inttostr(realrow2)+'*I'+inttostr(realrow2)+'*J'+inttostr(realrow2);
        data2[rowid,12] := '=K'+inttostr(realrow2)+'+L'+inttostr(realrow2);
      end else
      begin
        data2[rowid,10] := '';
        data2[rowid,11] := '';
        data2[rowid,12] := '';
      end;
      data2[rowid,13] := '=ROW()-7';
    inc(rowid);
    Next;
  end;

  GetWasteInfo_fin;

  e.Range('A',22,'N',22+BQuery.RecordCount-1).Value := data;


  e.SetActiveSheet('15-27');
  e.InsertRows(7,BQuery.RecordCount-1);

  e.Range('A',8,'N',8+BQuery.RecordCount-1).Value := data2;

  VarClear(data);

  e.SetActiveSheet('1-14');

  e.Free;
end;

end.
