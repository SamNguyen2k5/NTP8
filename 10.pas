program _10;

var
    s,t:string;

function valid(s:string):boolean;
var
    i:longint;
begin
    for i := 1 to length(s) do case s[i] of '0'..'9': ; else exit(false); end;
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

    n := length(a); r := ''; c := 0;
    for i := n downto 1 do
    begin
        d := fVal(a[i]) + fVal(b[i]) + c;
        c := d div 10; d := d mod 10;
        r := fStr(d) + r;
    end;

    if n <= 1 then sum := r
    else
    begin
        i := 1; while (r[i] = '0') and (i <= n) do inc(i);
        sum := copy(r,i,n-i+1);
    end;
end;

function product(a,b:string):string;
var
    p:string;
    i,n:longint;

    function product1(a:string; t:char):string;
    var
        i,c,d,n:longint;
        r:string;
    begin
        a := '0' + a; n := length(a); r := ''; c := 0;
        for i := n downto 1 do
        begin
            d := fVal(a[i]) * fVal(t) + c;
            c := d div 10; d := d mod 10;
            r := fStr(d) + r;
        end;

        if n <= 1 then product1 := r
        else
        begin
            i := 1; while (r[i] = '0') and (i <= n) do inc(i);
            product1 := copy(r,i,n-i+1);
        end;
    end;

begin
    p := ''; product := ''; n := length(b);
    for i := n downto 1 do
    begin
        product := sum(product, product1(a,b[i]) + p);
        p := p + '0';
    end;
end;

procedure input;
begin
    repeat write('s := '); readln(s) until valid(s);
    repeat write('t := '); readln(t) until valid(t);
end;

begin
    input;
    writeln('s * t = ',product(s,t));
end.
