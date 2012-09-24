unit uConf;

interface
uses SysUtils;
type
  TConfNode = class
  private
    FSubNodes: array[0..255] of TConfNode;
    FSubNodesCount: integer;
    FNodeName: AnsiString;
    FFullName: AnsiString;
    FValue: AnsiString;
    function getNode(index:AnsiString): TConfNode;
  public
    constructor Create(fullname:AnsiString;name:AnsiString);
    property Nodes[index:AnsiString]: TConfNode read getNode;
    property Value:AnsiString read FValue write FValue;
    property Name:AnsiString read FNodeName;
    property FullName:AnsiString read FFullName;
    procedure AddNode(node:TConfNode);

  end;

  TConfFile = class
  private
    FNodes: array[0..65535] of TConfNode;
    FNodesCount: integer;
    FSubNodes: array[0..4095] of TConfNode;
    FSubNodesCount: integer;
    function getNode(index:AnsiString): TConfNode;
    procedure setNodeValue(fullname:AnsiString;value:AnsiString);
    procedure AddNode(node:TConfNode);
    procedure AddNodeAll(node:TConfNode);
  public
    constructor Create;
    destructor Destroy;
    procedure Load(filename:AnsiString);
    function NodeValue(fullname:AnsiString;default:AnsiString=''):AnsiString;
    function NodeByName(fullname:AnsiString):TConfNode;
    property Nodes[index:AnsiString]: TConfNode read getNode;
  end;

implementation

constructor TConfNode.Create(fullname:AnsiString;name:AnsiString);
begin
 //
 FSubNodesCount := 0;
 FValue := '';
 FNodeName := name;
 FFullName := fullname;
end;

function TConfNode.getNode(index:AnsiString): TConfNode;
var
  i: integer;
begin
  result := nil;
  for i := 0 to FSubNodesCount - 1 do
  if LowerCase(FSubNodes[i].FNodeName)=LowerCase(index) then
  begin
    result := FSubNodes[i];
    exit;
  end;
  raise ERangeError.Create('node with name '+index+' not found');
end;

procedure TConfNode.AddNode(node:TConfNode);
begin
  FSubNodes[FSubNodesCount] := node;
  inc(FSubNodesCount);
end;



constructor TConfFile.Create;
begin
  FNodesCount := 0;
  FSubNodesCount := 0;
end;

destructor TConfFile.Destroy;
var
  i: integer;
begin
  for i := 0 to FNodesCount-1 do
  begin
    FNodes[i].Free;
  end;
end;

function TConfFile.getNode(index:AnsiString): TConfNode;
var
  i: integer;
begin
  result := nil;
  for i := 0 to FSubNodesCount - 1 do
  if LowerCase(FSubNodes[i].FNodeName)=LowerCase(index) then
  begin
    result := FSubNodes[i];
    exit;
  end;
  raise ERangeError.Create('node with name '+index+' not found');
end;

procedure TConfFile.Load(filename:AnsiString);
var
  f: TextFile;
  s,s2: AnsiString;
  p: integer;
begin
  AssignFile(f,filename);
  {$I-}
    Reset(f);
  {$I+}
  if IOResult <> 0 then raise EInOutError.Create('Config file "'+filename+'" not found');

  while not Eof(f) do
  begin
    ReadLn(f,s);
    s := Trim(s);
    if length(s) = 0 then continue;
    if s[1] = '#' then continue;
    p := pos('=',s);
    if p = 0 then continue;
    s2 := copy(s,p+1,length(s)-p);
    s := copy(s,1,p-1);
    s := trim(s);
    s2 := trim(s2);
    setNodeValue(s,s2);
  end;

  CloseFile(f);
end;

function TConfFile.NodeValue(fullname:AnsiString;default:AnsiString=''):AnsiString;
var
  i: integer;
begin
  for i := 0 to FNodesCount - 1 do
  if LowerCase(FNodes[i].FullName)=LowerCase(fullname) then
  begin
    result := FNodes[i].Value;
    exit;
  end;
  result := default;
end;

function TConfFile.NodeByName(fullname:AnsiString):TConfNode;
var
  i: integer;
begin
  result := nil;
  for i := 0 to FNodesCount - 1 do
  if LowerCase(FNodes[i].FullName)=LowerCase(fullname) then
  begin
    result := FNodes[i];
    exit;
  end;
end;

procedure TConfFile.AddNode(node:TConfNode);
begin
  FSubNodes[FSubNodesCount] := node;
  inc(FSubNodesCount);
end;

procedure TConfFile.AddNodeAll(node:TConfNode);
begin
  FNodes[FNodesCount] := node;
  inc(FNodesCount);
end;

procedure TConfFile.setNodeValue(fullname:AnsiString;value:AnsiString);
var
  node,parent,tmp: TConfNode;
  dir,dirname,s: AnsiString;
  p: integer;
begin
  node := NodeByName(fullname);
  if node <> nil then
  begin
    node.Value := value;
    exit;
  end;
  s := fullname;
  parent := nil;
  dirname := '';
  
  while true do
  begin
    p := pos('.',s);
    if p = 0 then
    begin
      node := TConfNode.Create(fullname,s);
      node.Value := value;

      if parent = nil then
      begin
        AddNode(node);
        AddNodeAll(node);
      end else
      begin
        parent.AddNode(node);
        AddNodeAll(node);
      end;

      break;
    end;

    dir := trim(copy(s,1,p-1));
    s := trim(copy(s,p+1,length(s)-p));

    if dirname <> '' then
    begin
      dirname := dirname + '.' + dir;
    end else
    begin
      dirname := dir;
    end;

    tmp := NodeByName(dirname);
    if tmp = nil then
    begin
      node := TConfNode.Create(dirname,dir);
      node.Value := '';
      if parent = nil then
      begin
        AddNode(node);
        AddNodeAll(node);
      end else
      begin
        parent.AddNode(node);
        AddNodeAll(node);
      end;
      parent := node;
    end else
    begin
      parent := tmp;
    end;

    node := nil;
    tmp := nil;
  end;

end;


end.
