unit fmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, RzLabel, RzEdit;

type
  TFormAbout = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzButton1: TRzButton;
    RzPanel3: TRzPanel;
    RzMemo1: TRzMemo;
    RzMemo2: TRzMemo;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.RzButton1Click(Sender: TObject);
begin
  Close;
end;

end.
