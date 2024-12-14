
# Mengen:
set SORTE;
set NÜSSE;

# Parameter:
param verkaufspreis{SORTE};
param einkaufspreis{NÜSSE};
param menge_max_wn;
param menge_max_hn;
param menge_max_en;
param menge_max_r;


# Variablen:
var Make {SORTE} >= 0;  # kg produzierte Arten von Studentenfutter
var zusammensetzung {SORTE, NÜSSE} >= 0; # Anteile Nüsse in Art Studentenfutter; es muss also bestimmt werden, wie viel von jeder SORTE als auch deren Zusammensetzung/Mischung bestimmt werden!

var Produce{SORTE} binary; #1, wenn SORTE produziert wird

# Zielfunktion für Teilaufgabe b):
maximize Gewinn: sum{s in SORTE} (Make[s] * (verkaufspreis[s] - (sum{n in NÜSSE} einkaufspreis[n] * zusammensetzung[s,n])) - 60*Produce[s]); 


# Restriktionen für Zusammensetzung:
subject to min_walnüsse_professor: zusammensetzung["PROFESSOR","WALNUSS"] >= 0.4;
subject to max_erdnuss_professor: zusammensetzung["PROFESSOR","ERDNUSS"] <= 0.25;
subject to min_walnüsse_mitarbeiter: zusammensetzung ["MITARBEITER","WALNUSS"] >= 0.2;
subject to max_erdnuss_mitarbeiter: zusammensetzung["MITARBEITER","ERDNUSS"] <= 0.6;
subject to max_erdnuss_studenten: zusammensetzung["STUDENTEN","ERDNUSS"] <= 0.2 * zusammensetzung["STUDENTEN","HASELNUSS"];
subject to min_rosinen_studenten: zusammensetzung["STUDENTEN", "ROSINEN"] >= 0.15 * (zusammensetzung["STUDENTEN","ERDNUSS"] + zusammensetzung["STUDENTEN","HASELNUSS"]);

#Restriktionen für Mengenkapazität:
subject to max_walnuss: sum{s in SORTE} Make[s] * zusammensetzung[s, "WALNUSS"] <= menge_max_wn;
subject to max_haselnuss: sum{s in SORTE} Make[s] * zusammensetzung[s, "HASELNUSS"] <= menge_max_hn;
subject to max_erdnuss: sum{s in SORTE} Make[s] * zusammensetzung[s, "ERDNUSS"] <= menge_max_en;
subject to max_rosinen: sum{s in SORTE} Make[s] * zusammensetzung[s, "ROSINEN"] <= menge_max_r;

#Restriktion das jede Art 100% aufgefüllt ist - die Zusammensetzungen (in Prozent bzw Gramm sollen insgesamt 1000g bzw. 100% ergeben):
subject to nüsse {s in SORTE}: sum{n in NÜSSE} zusammensetzung[s, n] = 1; 

#Restriktion für Fixkosten:
#uncomment für Teilfrage b)
subject to fixkosten {s in SORTE}: Make[s] <= 250*Produce[s];

#Restriktion für Mindesproduktion:
#uncomment für Teilfrage c)
subject to min_produce {s in SORTE}: Make[s] >= 30*Produce[s];
