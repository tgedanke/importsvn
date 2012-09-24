unit fmGetPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, ComCtrls, RzDTP, ExtCtrls, RzPanel;

type
  TFormGetPeriod = class(TForm)
    RzPanel1: TRzPanel;
    RzDateTimePicker1: TRzDateTimePicker;
    RzDateTimePicker2: TRzDateTimePicker;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGetPeriod: TFormGetPeriod;

  function GetPeriod(var d1,d2: TDateTime):boolean;
  
implementation

{$R *.dfm}


function GetPeriod(var d1,d2: TDateTime):boolean;
var
  d,m,y: word;

begin
  result := false;
  FormGetPeriod := TFormGetPeriod.Create(nil);

  DecodeDate(Date,y,m,d);
  
  FormGetPeriod.RzDateTimePicker1.DateTime := EncodeDate(y,m,1);
  FormGetPeriod.RzDateTimePicker2.DateTime := EncodeDate(y,m,MonthDays[IsLeapYear(y)][m]);
  
  if FormGetPeriod.ShowModal=mrOK then
  begin
    d1 := FormGetPeriod.RzDateTimePicker1.DateTime;
    d2 := FormGetPeriod.RzDateTimePicker2.DateTime;
    result := true;
  end;
  FormGetPeriod.Free;
end;

procedure TFormGetPeriod.RzButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormGetPeriod.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
