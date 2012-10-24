unit rOperations;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;

procedure Report_Operations_Build(year:word;quarter:byte;ceh:integer;otch:integer);

implementation

uses DB;

type
 TCeh = record
   id:integer;
   name: string;
 end;

 TNorm = record
   k: real;
   p: real;
 end;

procedure Report_Operations_Build(year:word;quarter:byte;ceh:integer;otch:integer);
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
  rowmap:array[1..5] of integer;
  weight: real;
  str: string;
  quarter1, year1: integer;
begin

 if (quarter>1) then
    begin
     quarter1 := quarter-1;
     year1 := year;
    end
 else begin
       quarter1 := 4;
       year1 := year-1;
      end;

case otch of
  0: begin
SQL := 'EXEC GetLimits '+IntToStr(quarter)+' ,'''+IntToStr(year)+'''';
     end;
  1: begin
SQL := 'exec dbo.wsReportCex ' + inttostr(ceh) + ',' + IntToStr(quarter) + ',' + IntToStr(year);
      {
      'SELECT  0 AS priz_zh, main.code_id, max(main.year), max(main.quarter), main.code, main.waste, main.class, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+                                          // AND (vr.operation_id <> 0)
       'WHERE  (vr.src_company_id = 5) AND (vr.waste = main.waste) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS obrazov, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 5) AND (vr.waste = main.waste) AND (vr.operation_id = 1) AND (vr.code = main.code) AND (vr.dst_dept_id = '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS isp, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 5) AND (vr.waste = main.waste) AND (vr.operation_id = 2) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS obezvr, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.src_company_id IN (5)) AND (vr.waste = main.waste) AND (vr.code = main.code) AND (vr.src_dept_id not in ('+inttostr(ceh)+')) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.dst_dept_id = '+inttostr(ceh)+')) AS priem_strukt, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.src_company_id IN (3, 6, 7, 8)) AND (vr.waste = main.waste) AND (vr.code = main.code) AND (vr.src_dept_id  <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.dst_dept_id = '+inttostr(ceh)+')) AS priem_ind, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 5) AND (vr.waste = main.waste) AND (vr.operation_id = 1) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_isp, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 2) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_obezvr, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 3) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_zahor, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id < 0) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_hran, ' +
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 5) AND (vr.waste = main.waste) AND (vr.operation_id < 0) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter >= 1) AND (vr.quarter < '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS nach_hran, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 5) AND (vr.waste = main.waste) AND (vr.operation_id = 0) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year1)+') AND (vr.quarter >= 1) AND (vr.quarter <= '+inttostr(quarter1)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS nach_nakop, '+
      }
     { '(select max(wy.balance_o) as balance '+
       'from travmbez.dbo.ws_view_report as wr '+
            'left join travmbez.dbo.ws_codes_year as wy on wy.year=wr.year and wy.code_id=wr.code_id '+
       'WHERE  (wr.dst_company_id = 5) AND (wr.waste = main.waste) AND (wr.operation_id >= 0) AND (wr.code = main.code) AND (wr.dst_dept_id = '+inttostr(ceh)+') AND '+
               '(wr.year = '+inttostr(year)+') AND (wr.quarter = '+inttostr(quarter)+') AND (wr.src_dept_id = '+inttostr(ceh)+')) AS nach_nakop, '+
      }
      {
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 5) AND (vr.waste = main.waste) AND (vr.operation_id < 0) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter >= 1) AND (vr.quarter <= '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS kon_hran, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 5) AND (vr.waste = main.waste) AND (vr.operation_id = 0) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter >= 1) AND (vr.quarter <= '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS kon_nakop, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 8) AND (vr.waste = main.waste) AND (vr.operation_id = 3) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS razm_zahor, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id = 8) AND (vr.waste = main.waste) AND (vr.operation_id < 0) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS razm_hran '+
      'FROM      travmbez.dbo.ws_view_report AS main  '+
      'WHERE     (main.year = '+inttostr(year)+') AND (main.quarter = '+inttostr(quarter)+') AND (main.src_dept_id = '+inttostr(ceh)+') or '+
         '((main.operation_id = 0) AND (main.year = '+inttostr(year1)+') AND (main.quarter >= 1) AND (main.quarter <= '+inttostr(quarter1)+') AND (main.src_dept_id = '+inttostr(ceh)+')) '+
      'GROUP BY  main.code_id, main.code, main.waste, main.class '+
      'ORDER BY class, code'; //main.year, main.quarter,
      }
     end;
  2: begin
SQL := 'SELECT  main.code_id, main.year, main.quarter, main.code, main.waste, main.class, main.dst_company, main.dst_dept, com.contract, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 1) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_isp, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 2) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_obezvr, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 3) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_zahor, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id < 0) AND (vr.code = main.code) AND (vr.dst_dept_id <> '+inttostr(ceh)+') AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_dept_id = '+inttostr(ceh)+')) AS pered_hran ' +
      'FROM      travmbez.dbo.ws_view_report AS main, travmbez.dbo.ws_companies AS com  '+
        'WHERE     (main.year = '+inttostr(year)+') AND (main.quarter = '+inttostr(quarter)+') AND main.dst_company_id=com.id AND (main.src_dept_id = '+inttostr(ceh)+')  AND main.dst_company_id NOT IN (5) '+
      'GROUP BY  main.code_id, main.year, main.quarter, main.code, main.waste, main.class, main.dst_company, main.dst_dept, com.contract '+
      'ORDER BY class, code';
     end;
  3: begin
SQL := 'SELECT  main.code_id, main.year, main.quarter, main.code, main.waste, main.class, main.src_company, com.contract, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.src_company_id IN (3, 6, 7, 8)) AND (vr.waste = main.waste) AND (vr.operation_id = 1) AND (vr.code = main.code) AND (vr.dst_company_id = 5) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+')) AS priem_isp, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.src_company_id IN (3, 6, 7, 8)) AND (vr.waste = main.waste) AND (vr.operation_id = 2) AND (vr.code = main.code) AND (vr.dst_company_id = 5) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+')) AS priem_obezvr, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.src_company_id IN (3, 6, 7, 8)) AND (vr.waste = main.waste) AND (vr.operation_id = 3) AND (vr.code = main.code) AND (vr.dst_company_id = 5) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+')) AS priem_zahor, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.src_company_id IN (3, 6, 7, 8)) AND (vr.waste = main.waste) AND (vr.operation_id < 0) AND (vr.code = main.code) AND (vr.dst_company_id = 5) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+')) AS priem_hran ' +
      'FROM      travmbez.dbo.ws_view_report AS main, travmbez.dbo.ws_companies AS com  '+
      'WHERE     (main.year = '+inttostr(year)+') AND (main.quarter = '+inttostr(quarter)+') AND main.src_company_id=com.id AND main.src_company_id NOT IN (5) '+
      'GROUP BY  main.code_id, main.year, main.quarter, main.code, main.waste, main.class, main.src_company, com.contract '+
      'ORDER BY class, code';
     end;
  4: begin
SQL := 'SELECT  main.code_id, main.year, main.quarter, main.code, main.waste, main.class, main.dst_company, main.dst_dept, com.contract, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 1) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_company_id = 5)) AS pered_isp, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 2) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_company_id = 5)) AS pered_obezvr, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 3) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_company_id = 5)) AS pered_zahor, '+
      '(SELECT SUM(vr.weight) AS Expr1 '+
       'FROM   travmbez.dbo.ws_view_report AS vr '+
       'WHERE  (vr.dst_company_id NOT IN (5)) AND (vr.waste = main.waste) AND (vr.operation_id = 5) AND (vr.code = main.code) AND '+
              '(vr.year = '+inttostr(year)+') AND (vr.quarter = '+inttostr(quarter)+') AND (vr.src_company_id = 5)) AS pered_hran ' +
      'FROM      travmbez.dbo.ws_view_report AS main, travmbez.dbo.ws_companies AS com  '+
        'WHERE     (main.year = '+inttostr(year)+') AND (main.quarter = '+inttostr(quarter)+') AND main.dst_company_id=com.id AND (main.src_company_id = 5) AND main.dst_company_id NOT IN (5) '+
      'GROUP BY  main.code_id, main.year, main.quarter, main.code, main.waste, main.class, main.dst_company, main.dst_dept, com.contract '+
      'ORDER BY class, code';
     end;
  end;
ADOQueryExecute(AQuery,sql);

case otch of
  0: begin
       rowmap[1] := 16;
       rowmap[2] := 41;
       rowmap[3] := 77;
       rowmap[4] := 202;
       rowmap[5] := 427;
     end;
  1: begin
       rowmap[1] := 16;
       rowmap[2] := 41;
       rowmap[3] := 76;
       rowmap[4] := 201;
       rowmap[5] := 431;  
     end;
  2,4: begin
       rowmap[1] := 16;
       rowmap[2] := 45;
       rowmap[3] := 74;
       rowmap[4] := 198;
       rowmap[5] := 426; 
     end; 
  3: begin
       rowmap[1] := 16;
       rowmap[2] := 40;
       rowmap[3] := 74;
       rowmap[4] := 188;
       rowmap[5] := 417;  
     end;
  end;

  /// write data to Excel document                        
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  case otch of
    0: e.Open(path+'templates\oos\обобщенный.xlt');
    1: e.Open(path+'templates\oos\по цехам.xlt');
    2,4: e.Open(path+'templates\oos\переданные.xlt');
    3: e.Open(path+'templates\oos\принятые.xlt');
  end;
  e.Show;

  for I := 1 to 5 do
  begin

    AQuery.Filter := 'class='+inttostr(i);
    AQuery.Filtered := true;

    if AQuery.RecordCount = 0 then
      continue;

    AQuery.First;
    rowid := 0;

    case otch of
      0: begin
      while not AQuery.Eof do
      begin
        e.Cells[8,rowid+rowmap[i]] := AQuery.FieldByName('waste').AsVariant;
        e.Cells[26,rowid+rowmap[i]] := AQuery.FieldByName('code').AsVariant;
        e.Cells[35,rowid+rowmap[i]] := AQuery.FieldByName('nach_hran').AsFloat;
        e.Cells[43,rowid+rowmap[i]] := AQuery.FieldByName('nach_nakop').AsFloat;
        e.Cells[51,rowid+rowmap[i]] := AQuery.FieldByName('obrazov').AsFloat;
        e.Cells[59,rowid+rowmap[i]] := AQuery.FieldByName('priem_ind').AsFloat;
        e.Cells[74,rowid+rowmap[i]] := AQuery.FieldByName('isp').AsFloat;
        e.Cells[83,rowid+rowmap[i]] := AQuery.FieldByName('obezvr').AsFloat;
        e.Cells[98,rowid+rowmap[i]] := AQuery.FieldByName('pered_isp').AsFloat;
        e.Cells[106,rowid+rowmap[i]] := AQuery.FieldByName('pered_obezvr').AsFloat;
        e.Cells[114,rowid+rowmap[i]] := AQuery.FieldByName('pered_hran').AsFloat;
        e.Cells[122,rowid+rowmap[i]] := AQuery.FieldByName('pered_zahor').AsFloat;
        e.Cells[136,rowid+rowmap[i]] := AQuery.FieldByName('razm_hran').AsFloat;
        e.Cells[144,rowid+rowmap[i]] := AQuery.FieldByName('razm_zahor').AsFloat;
        e.Cells[152,rowid+rowmap[i]] := AQuery.FieldByName('kon_hran').AsFloat;
        // e.Cells[160,rowid+rowmap[i]] := AQuery.FieldByName('kon_nakop').AsFloat;
       // e.Sheet.Rows[rowid+rowmap[i]].RowHeight:= 10;
        AQuery.Next;
        rowid:= rowid+1;
      end;
      e.Cells[110,7] := quarter;
      e.Cells[130,7] := year;
     end;
  1: begin
    while not AQuery.Eof do
    begin
      e.Cells[8,rowid+rowmap[i]] := AQuery.FieldByName('waste').AsVariant;
      e.Cells[25,rowid+rowmap[i]] := AQuery.FieldByName('code').AsVariant;
      if (AQuery.FieldByName('nach_hran').AsFloat=0) then e.Cells[33,rowid+rowmap[i]] := '0,00' else
      e.Cells[33,rowid+rowmap[i]] := AQuery.FieldByName('nach_hran').AsFloat;
      if (AQuery.FieldByName('nach_nakop').AsFloat=0) then e.Cells[40,rowid+rowmap[i]] := '0,00' else
      e.Cells[40,rowid+rowmap[i]] := AQuery.FieldByName('nach_nakop').AsFloat;
      if (AQuery.FieldByName('obrazov').AsFloat=0) then e.Cells[47,rowid+rowmap[i]] := '0,00' else
      e.Cells[47,rowid+rowmap[i]] := AQuery.FieldByName('obrazov').AsFloat;
      if (AQuery.FieldByName('priem_strukt').AsFloat=0) then e.Cells[60,rowid+rowmap[i]] := '0,00' else
      e.Cells[60,rowid+rowmap[i]] := AQuery.FieldByName('priem_strukt').AsFloat;
      if (AQuery.FieldByName('priem_ind').AsFloat=0) then e.Cells[69,rowid+rowmap[i]] := '0,00' else
      e.Cells[69,rowid+rowmap[i]] := AQuery.FieldByName('priem_ind').AsFloat;
      if (AQuery.FieldByName('isp').AsFloat=0) then e.Cells[84,rowid+rowmap[i]] := '0,00' else
      e.Cells[84,rowid+rowmap[i]] := AQuery.FieldByName('isp').AsFloat;
      if (AQuery.FieldByName('obezvr').AsFloat=0) then e.Cells[92,rowid+rowmap[i]] := '0,00' else
      e.Cells[92,rowid+rowmap[i]] := AQuery.FieldByName('obezvr').AsFloat;
      if (AQuery.FieldByName('pered_isp').AsFloat=0) then e.Cells[106,rowid+rowmap[i]] := '0,00' else
      e.Cells[106,rowid+rowmap[i]] := AQuery.FieldByName('pered_isp').AsFloat;
      if (AQuery.FieldByName('pered_obezvr').AsFloat=0) then e.Cells[113,rowid+rowmap[i]] := '0,00' else
      e.Cells[113,rowid+rowmap[i]] := AQuery.FieldByName('pered_obezvr').AsFloat;
      if (AQuery.FieldByName('pered_hran').AsFloat=0) then e.Cells[120,rowid+rowmap[i]] := '0,00' else
      e.Cells[120,rowid+rowmap[i]] := AQuery.FieldByName('pered_hran').AsFloat;
      if (AQuery.FieldByName('pered_zahor').AsFloat=0) then e.Cells[127,rowid+rowmap[i]] := '0,00' else
      e.Cells[127,rowid+rowmap[i]] := AQuery.FieldByName('pered_zahor').AsFloat;
      if (AQuery.FieldByName('razm_hran').AsFloat=0) then e.Cells[140,rowid+rowmap[i]] := '0,00' else
      e.Cells[140,rowid+rowmap[i]] := AQuery.FieldByName('razm_hran').AsFloat;
      if (AQuery.FieldByName('razm_zahor').AsFloat=0) then e.Cells[147,rowid+rowmap[i]] := '0,00' else
      e.Cells[147,rowid+rowmap[i]] := AQuery.FieldByName('razm_zahor').AsFloat;
      if (AQuery.FieldByName('kon_hran').AsFloat=0) then e.Cells[154,rowid+rowmap[i]] := '0,00' else
      e.Cells[154,rowid+rowmap[i]] := AQuery.FieldByName('kon_hran').AsFloat;
  //    if (AQuery.FieldByName('kon_nakop').AsFloat=0) then e.Cells[161,rowid+rowmap[i]] := '0,00' else
 //     e.Cells[161,rowid+rowmap[i]] := AQuery.FieldByName('kon_nakop').AsFloat;
   //   e.Sheet.Rows[rowid+rowmap[i]].RowHeight:= 10;
      AQuery.Next;
      rowid:= rowid+1;
    end;
    e.Cells[131,7] := quarter;
    e.Cells[151,7] := year;
     end;
  2,4: begin
    while not AQuery.Eof do
    begin
      e.Cells[10,rowid+rowmap[i]] := AQuery.FieldByName('waste').AsVariant;
      e.Cells[29,rowid+rowmap[i]] := AQuery.FieldByName('code').AsVariant;
      e.Cells[53,rowid+rowmap[i]] := AQuery.FieldByName('pered_isp').AsFloat;
      e.Cells[69,rowid+rowmap[i]] := AQuery.FieldByName('pered_obezvr').AsFloat;
      e.Cells[85,rowid+rowmap[i]] := AQuery.FieldByName('pered_hran').AsFloat;
      e.Cells[97,rowid+rowmap[i]] := AQuery.FieldByName('pered_zahor').AsFloat;
      e.Cells[113,rowid+rowmap[i]] := AQuery.FieldByName('dst_dept').AsVariant+' '+AQuery.FieldByName('dst_company').AsVariant;
      e.Cells[149,rowid+rowmap[i]] := AQuery.FieldByName('contract').AsVariant;
      //.Sheet.Rows[rowid+rowmap[i]].RowHeight:= 10;
      AQuery.Next;
      rowid:= rowid+1;
    end;
    e.Cells[106,7] := quarter;
    e.Cells[126,7] := year;
     end;
  3: begin
    while not AQuery.Eof do
    begin
      e.Cells[10,rowid+rowmap[i]] := AQuery.FieldByName('waste').AsString;
      e.Cells[29,rowid+rowmap[i]] := AQuery.FieldByName('code').AsString;      
      e.Cells[60,rowid+rowmap[i]] := AQuery.FieldByName('priem_isp').AsFloat;
      e.Cells[76,rowid+rowmap[i]] := AQuery.FieldByName('priem_obezvr').AsFloat;
      e.Cells[92,rowid+rowmap[i]] := AQuery.FieldByName('priem_hran').AsFloat;
      e.Cells[105,rowid+rowmap[i]] := AQuery.FieldByName('priem_zahor').AsFloat;
      e.Cells[120,rowid+rowmap[i]] := AQuery.FieldByName('src_company').AsString;
      e.Cells[148,rowid+rowmap[i]] := AQuery.FieldByName('contract').AsString;
     // e.Sheet.Rows[rowid+rowmap[i]].RowHeight:= 10;
      AQuery.Next;
      rowid:= rowid+1;
    end;
    e.Cells[106,7] := inttostr(quarter);
    e.Cells[126,7] := inttostr(year);
     end;
  end;
  if otch=1 then
    begin
      SQL := 'select comp.name as company, dept.name as company_dept '+
             'from travmbez.dbo.ws_companies as comp, travmbez.dbo.ws_company_dept as dept '+
             'where dept.company_id=comp.id AND dept.id='+inttostr(ceh);
      ADOQueryExecute(DQuery,sql);
      DQuery.First;
      e.Cells[11,7] := DQuery.FieldByName('company_dept').AsString;
      e.Cells[55,7] := DQuery.FieldByName('company').AsString;
    end;
  if otch=2 then
    begin
      SQL := 'select comp.name as company, dept.name as company_dept '+
             'from travmbez.dbo.ws_companies as comp, travmbez.dbo.ws_company_dept as dept '+
             'where dept.company_id=comp.id AND dept.id='+inttostr(ceh);
      ADOQueryExecute(DQuery,sql);
      DQuery.First;
      e.Cells[26,7] := DQuery.FieldByName('company_dept').AsString+'; '+DQuery.FieldByName('company').AsString;
    end;

    VarClear(data);
  end;

  e.Free;
end;

end.
