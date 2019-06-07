//Menu parfait + enregistrements des joeurs et leurs scores en pourcentage//
program JeuCalcul;
uses crt,Dos;
const n=11;
type
	data = record
		name:integer;
		scores:Real;
	end;
	
	block=array[1..1000] of data;	
	tabl=array[1..5] of char;
	tableau=array[1..n] of integer;
var
	a:integer;
	test,i,j,reponse,resultat,score,score2,compt,utilisateur:integer;
	nom,ope,opera:string;
	tab:tableau;
	save:block;
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


function operateur(n:integer):string;
var indice:integer;
	vec:tabl;
begin
	randomize;
	indice:=random(n)+1;
	vec[1]:='+';
	vec[2]:='-';
	vec[3]:='*';
	operateur:=vec[indice];
end;

procedure somme();
begin
	writeln('Memorisez le calcul suivant :');
	writeln(tab[i],' + ',tab[i+1]);
	writeln('patientez svp ...');
	delay(750);
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

procedure soustraction();
begin
	writeln('Memorisez le calcul suivant :');
	writeln(tab[i],' - ',tab[i+1]);
	writeln('patientez svp ...');
	delay(750);
	clrscr;
	write('donnez le resultat =');
	readln(reponse);
	resultat:=(tab[i]-tab[i+1]);
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


procedure multiplication();
begin
	writeln('Memorisez le calcul suivant :');
	writeln(tab[i],' * ',tab[i+1]);
	writeln('patientez svp ...');
	delay(1000);
	clrscr;
	write('donnez le resultat =');
	readln(reponse);
	resultat:=(tab[i]*tab[i+1]);
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

//En travaux//

procedure remplissage();
begin
	for i:=1 to 10 do
		begin
			opera:=operateur(2);
			writeln(opera);
		end;
	writeln('votre tableau');
	for i:=1 to 10 do writeln(tab[i],' ');
end;
//fin des travaux//

procedure jeux();
begin
	temps();
	for i:=1 to n do tab[i]:=random(20);
	
	(*remplissage();*) //BIENTOT DISPONIBLE , EN TRAVAUX//
	(*for i:=1 to (n-1) do write(tab[i],' ');*)
	i:=1; compt:=0;
	score:=0;score2:=0;
	
	while i<=(n-1) do
		begin
			ope:=operateur(3);
			case ope of
			'+': somme();
			'-': soustraction();
			'*': multiplication()
		end
			
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
	save[j].scores:=(score/5)*100;
	delay(2000);
	clrscr;
end;

function repetitionMenu():integer;
begin
	clrscr;
	for i:=1 to (j-1) do
			writeln(save[i].name,'          ',save[i].scores:2:2,' points');
	writeln('tapez n importe quel touche pour continuer');
	readkey;
	clrscr;
	writeln('Tapez 1 pour rejouer');
	writeln('tapez 2 pour quitter');
	writeln('Tapez 3 pour consulter les records');
	read(utilisateur);
	if utilisateur=3 then repetitionMenu();	
end;


//DEBUT DU PROGRAMME
begin
	Writeln('Vous avez le choix entre :');
	writeln('Tapez 1 pour jouer');
	writeln('tapez 2 pour quitter');
	writeln('Tapez 3 pour consulter les records');
	read(utilisateur);
	clrscr;
	j:=1;
	if utilisateur=1 then
		begin
			repeat
			clrscr;
			writeln('Jeux de Calcul mental');
			writeln('Bonjour, Quel est votre nom ?');
			read(save[j].name);
			clrscr;
			jeux();
			j:=j+1;
			writeln('Tapez 1 pour rejouer');
			writeln('tapez 2 pour quitter');
			writeln('Tapez 3 pour consulter les records');
			read(utilisateur);
			if utilisateur=3 then
				begin
					repetitionMenu();
				end;
			until utilisateur=2;
		end
	else if utilisateur=3 then
		begin
			writeln('Il n y a aucune sauvegarges');
			delay(2500);
		end;
	clrscr;
	writeln('MERCI D Avoir utilisé notre programme',nom);
end.
