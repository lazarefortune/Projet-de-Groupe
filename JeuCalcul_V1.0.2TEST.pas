program JeuCalcul;
uses crt,Dos;
const n=21;
type
	tableau=array[1..n] of integer;
var
	a:integer;
	i,reponse,resultat,score,score2,compt:integer;
	nom:string;
	tab:tableau;
(*	t1,t2,t3:Real;
	h,m,s,c:word;
	
procedure chrono(b:boolean);
var h,m,s,c:word;
begin
	GetTime(h,m,n,s,c);
	if b then t1 := h*3600 + m*60+ s + c/100
	else
		begin
			t2 := h*3600 + m*60+ s + c/100;
			t3 := t2 -t1;
		end;
end;

begin
	clrscr;
	chrono(true);
	delay(1000);
	chrono(false);
	write('Temps: ',t3:0:2,' s');
	readkey;
end.*) 
procedure temps();
begin
	a:=5;
	while (a>=0) do
		begin
			clrscr;
			writeln(a);
			a:=a-1;
			delay(1000);
		end;
end;







	
begin
	writeln('Calcul mental');
	writeln('Bonjour, Quel est votre nom ?');
	readln(nom);
	clrscr;
	randomize;
	for i:=1 to 
	n do tab[i]:=random(100);
	(*for i:=1 to (n-1) do write(tab[i],' ');*)
	i:=1; compt:=0;
	score:=0;score2:=0;
	while i<=(n-1) do
		begin
			writeln('Memorisez le calcul suivant :');
			writeln(tab[i],' + ',tab[i+1]);
			writeln('patientez svp ...');
			delay(5000);
			clrscr;
			write('donnez le resultat =');
			readln(reponse);
			resultat:=(tab[i]+tab[i+1]);
			compt:=compt+1;
			if (reponse=resultat) then
				begin
					writeln('VRAI');
					score:=score+1;
				end
			else 
				begin
					writeln('FAUX ',resultat);
					score2:=score2+1;
				end;
			writeln('plus que ',10-compt,' calculs à faire');
			delay(1500);
			clrscr;
			i:=i+2;
		end;
	writeln(nom,' vous avez ',score,' bonnes reponses');
	writeln('et ',score2,' mauvaises reponses');
	clrscr;
	for i:=1 to 80 do write('*');
	textcolor(RED);
	write('FELICITATIONS')
end.
