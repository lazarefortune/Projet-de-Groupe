program JeuCalcul;
uses crt;
const n=11;
type
	tableau=array[1..n] of integer;
var
	i,reponse,resultat,score,score2:integer;
	nom:string;
	tab:tableau;
begin
	(*textcolor(Black);*)
	writeln('Bonjour, Quel est votre nom ?');
	readln(nom);
	randomize;
	for i:=1 to 
	n do tab[i]:=random(100);
	(*for i:=1 to (n-1) do write(tab[i],' ');*)
	i:=1;
	while i<=(n-1) do
		begin
			writeln('entrez le resultat du calcul');
			write(tab[i],' + ',tab[i+1], '=');
			readln(reponse);
			resultat:=(tab[i]+tab[i+1]);
			if (reponse=resultat) then score:=score+1
			else score2:=score2+1;
			clrscr;
			i:=i+2;
		end;
	writeln(nom,' vous avez ',score,' bonnes reponses');
	writeln('et ',score2,' mauvaises reponses');
end.
