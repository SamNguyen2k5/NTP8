program _10;

var
    s,t:string;

function valid(s:string):boolean;
var
    i:longint;
begin
    for i := 1 to length(s) do case s[i] of '0'..'9': ; else exit(false);
    exit(true);
end;

function fVal(s:string):longint; begin val(s,fVal); end;
function fStr(n:longint):string; begin str(n,fStr); end;

function sum(a,b:string):string; //Assume a,b are valid and have no extra spaces
var
    i,c,d,n:longint;
    r:string;
begin
    while length(a) < length(b) do a := '0' + a;
    while length(b) < length(a) do b := '0' + b;
    a := '0' + a; b := '0' + b;

    n := length(a);
    for i := n downto 1 do
    begin
        d := fVal(a[i]) + fVal(b[i]) + c;
        c := d div 10; d := d mod 10;
        r := r + fStr(d);
    end;
    i := 1; while r[i] = ' ' do inc(i);
    sum := copy(r,i,n-i+1);
end;

procedure input;
begin
    repeat readln(s) until valid(s);
    repeat readln(t) until valid(t);
end;

begin
    input;
end.