program _2;

var
    n:longint;

function fib(n:longint):longint;
begin
    case n of
        1: fib := 0;
        2: fib := 1;
        else fib := fib(n-1) + fib(n-2);
    end;
end;

begin
    readln(n);
    writeln(fib(n));
end.