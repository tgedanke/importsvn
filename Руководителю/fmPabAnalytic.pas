unit fmPabAnalytic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, StdCtrls, RzCmboBx, RzButton, RzTabs,DataModule;

type
  TFormAnalytic = class(TForm)
    TSH: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    lYear1: TRzComboBox;
    lMonth: TRzComboBox;
    lYear2: TRzComboBox;
    lYear3: TRzComboBox;
    lQuarter: TRzComboBox;
    lCeh1: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



  function GetAnalytic(var mode:integer;var ceh_id:integer;var dt1:TDateTime;var dt2:TDateTime):boolean;
  
implementation

{$R *.dfm}

function GetAnalytic(var mode:integer;var ceh_id:integer;var dt1:TDateTime;var dt2:TDateTime):boolean;
var
  FormAnalytic: TFormAnalytic;
  y1,m1,d1: word;
  y2,m2,d2,q: word;
begin
  result := false;
  FormAnalytic := TFormAnalytic.Create(nil);

  if mode = 1 then FormAnalytic.TSH.ActivePageIndex := 0;
  if mode = 2 then FormAnalytic.TSH.ActivePageIndex := 1;
  if mode = 3 then FormAnalytic.TSH.ActivePageIndex := 2;

  FormAnalytic.lCeh1.Value := inttostr(ceh_id);


  if ceh_id <> 0 then
  begin
    FormAnalytic.lCeh1.Enabled := false;

  end;

  if FormAnalytic.ShowModal = mrOK then
  begin
    case FormAnalytic.TSH.ActivePageIndex of
    0: begin
        mode := 1;
        y1 := strtoint(FormAnalytic.lYear1.Value);
        m1 := StrToInt(FormAnalytic.lMonth.Value);
        d1 := 1;
        y2 := y1;
        m2 := m1;
        d2 := MonthDays[IsLeapYear(y2)][m2];
        ceh_id := strtoint(FormAnalytic.lCeh1.Value);
      end;
    1: begin
        mode := 2;
        y1 := strtoint(FormAnalytic.lYear2.Value);
        q := StrToInt(FormAnalytic.lQuarter.Value);
        m1 := (q-1)*3+1;
        d1 := 1;
        y2 := y1;
        m2 := m1+2;
        d2 := MonthDays[IsLeapYear(y2)][m2];
      end;
    2: begin
        mode := 3;
        y1 := strtoint(FormAnalytic.lYear3.Value);
        m1 := 1;
        d1 := 1;
        y2 := y1;
        m2 := 12;
        d2 := 31;
      end;
    end;
    dt1 := EncodeDate(y1,m1,d1);
    dt2 := EncodeDate(y2,m2,d2);

    result := true;
  end;
  FormAnalytic.Free;
end;

procedure TFormAnalytic.FormCreate(Sender: TObject);
var
  i: integer;
  d,m,y: word;
begin
  DecodeDate(Now,y,m,d);
  
  for i := 1 to 15 do
  begin
    lYear1.AddItemValue(inttostr(2009+i),inttostr(2009+i));
    lYear2.AddItemValue(inttostr(2009+i),inttostr(2009+i));
    lYear3.AddItemValue(inttostr(2009+i),inttostr(2009+i));
  end;

  lYear1.Value := inttostr(y);
  lYear2.Value := inttostr(y);
  lYear3.Value := inttostr(y);

  lQuarter.AddItemValue('I','1');
  lQuarter.AddItemValue('II','2');
  lQuarter.AddItemValue('III','3');
  lQuarter.AddItemValue('IV','4');

  lQuarter.Value := IntToStr((m-1) div 3+1);
  
  for i := 1 to 12 do
  begin
    lMonth.AddItemValue(months[i],inttostr(i));
  end;

  lMonth.Value := inttostr(m);

  ADOQueryExecute(AQuery,'select * from pab_ceh order by name');

  lCeh1.AddItemValue('Все','0');


  AQuery.First;
  while not AQuery.EOF do
  with AQuery do
  begin
    lCeh1.AddItemValue(FieldByName('name').AsString,FieldByName('id').AsString);
    Next;
  end;

end;

procedure TFormAnalytic.RzButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormAnalytic.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
