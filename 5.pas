program _5;

const
    MAX = 10000;

var
    a:array[1..MAX] of longint;
    n:longint;

function fStr(n:longint):string;
begin
    str(n,fStr);
end;

function ispalin(s:string):boolean;
begin
    if length(s) < 2 then ispalin := true
    else if s[1] <> s[length(s)] then ispalin := false
    else ispalin := ispalin(copy(s,2,length(s)-2));
end;

procedure input;
var
    i:longint;
begin
    readln(n); for i := 1 to n do read(a[i]);
end;

procedure res;
var
    i:longint;
begin
    for i := 1 to n do if ispalin(fStr(a[i])) then write(a[i],' '); writeln;
end;

begin
    input;
    res;
end.