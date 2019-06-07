program JeuCalcul;
uses crt,Dos;
const n=11;
type
	tabl=array[1..5] of char;
	tableau=array[1..n] of integer;
var
	a:integer;
	i,reponse,resultat,score,score2,compt,utilisateur:integer;
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
	while (a>=1) do
		begin
			(*clrscr;*)
			write(' ',a,' -->');
			a:=a-1;
			delay(1000);
		end;
	writeln(' ',a);
	delay(1000);
	writeln('C est parti');
	delay(1000);
	clrscr;
end;


function operateur():string;
var indice:integer;
	vec:tabl;
begin
	randomize;
	indice:=random(3)+1;
	vec[1]:='+';
	vec[2]:='-';
	vec[3]:='*';
	operateur:=vec[indice];
end;




procedure jeux();
begin
	writeln('Jeux de Calcul mental');
	writeln('Bonjour, Quel est votre nom ?');
	readln(nom);
	clrscr;
	temps();
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
			writeln('plus que ',5-compt,' calculs à faire');
			delay(1500);
			clrscr;
			i:=i+2;
		end;
	writeln(nom,' vous avez ',score,' bonnes reponses');
	writeln('et ',score2,' mauvaises reponses');
	delay(3000);
	clrscr;
	if score>=3 then
		begin
			for i:=1 to 115 do write('*');
			write('FELICITATIONS');
			for i:=1 to 112 do write('*');
		end
	else
	begin
		for i:=1 to 115 do write('*');
		write('DOMMAGE');
		for i:=1 to 118 do write('*');
	end;
	delay(2000);
	clrscr;
end;

begin
	writeln('Tapez 1 pour jouer');
	writeln('tapez 2 pour quitter');
	read(utilisateur);
	if utilisateur=1 then
		begin
			repeat
			clrscr;
			jeux();
			writeln('Tapez 1 pour rejouer');
			writeln('tapez 2 pour quitter');
			read(utilisateur);
			until utilisateur=2;
		end;
	writeln('MERCI D Avoir utilisé notre programme',nom);
	
end.













