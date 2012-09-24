unit fmCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, GridsEh, DBGridEh,
  DataModule, DB, ADODB, RzDBNav;

type
  TFormOOSCompanies = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzButton1: TRzButton;
    tblCompany: TADOTable;
    RzPanel4: TRzPanel;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    RzPanel5: TRzPanel;
    DBGridEh2: TDBGridEh;
    dsCompany: TDataSource;
    dsDepts: TDataSource;
    tblDepts: TADOTable;
    RzPanel6: TRzPanel;
    RzPanel7: TRzPanel;
    RzDBNavigator1: TRzDBNavigator;
    RzDBNavigator2: TRzDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOOSCompanies: TFormOOSCompanies;

implementation

{$R *.dfm}

procedure TFormOOSCompanies.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormOOSCompanies.RzButton1Click(Sender: TObject);
begin
  Close;
end;

end.
