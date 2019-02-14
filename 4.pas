program _4;

const
    MAX = 10000;

type
    TWords = array[1..MAX] of string;

var
    words:TWords;
    s:string;
    n,i:longint;

procedure init;
begin
    fillchar(words,sizeof(words),0);
end;

procedure sep(s:string; var words:TWords; var n:longint);
var
    i:longint;
    w:string;

    procedure insert(w:string; var words:TWords; var n:longint);
    begin
        inc(n); words[n] := w;
    end;

begin
    s := s + ' '; w := '';
    for i := 1 to length(s) do
    begin
        if (s[i] = ' ') and (w <> '') then
        begin
            insert(w,words,n);
            w := '';
        end
        else w := w + s[i];
    end;
end;

procedure write(words:TWords; n:longint);
var
    i:longint;
begin
    for i := 1 to n do writeln(words[i]);
end;

begin
    readln(s); init;
    sep(s,words,n);
    write(words,n);
end.