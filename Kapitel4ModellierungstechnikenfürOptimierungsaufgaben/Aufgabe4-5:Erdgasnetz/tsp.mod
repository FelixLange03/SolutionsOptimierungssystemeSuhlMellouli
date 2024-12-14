
# Mengen:
set GEBIETE;

# Parameter:
param ertrag{GEBIETE};
param investitionskosten{GEBIETE};
param bauzeit{GEBIETE};
param max_bauzeit;

# Variablen:
var Ausbau{GEBIETE} binary;  # 1, wenn Gebiet ausgebaut wird
var yMehrAlsZwei binary;
var Verteilstation{GEBIETE} binary; #1, wenn in Gebiet Verteilsation gebaut wird

# Zielfunktion für Teilaufgabe b):
maximize Gewinn: sum{g in GEBIETE} Ausbau[g]*(ertrag[g] - investitionskosten[g] - 500*Verteilstation[g]); 


# Restriktionen für Erschließungsvoraussetzung:
subject to B_möglich_wenn_A: Ausbau["A"] >= Ausbau["B"];
subject to C_möglich_wenn_B: Ausbau["B"] >= Ausbau["C"];
subject to E_möglich_wenn_D: Ausbau["D"] >= Ausbau["E"];

#Restriktion für Bauzeit:
subject to summierte_bauzeit: sum {g in GEBIETE} Ausbau[g] * bauzeit[g] <= max_bauzeit;

#uncomment für Aufgabe b)
#Restriktion für mehr als zwei verrohrte Gebiete:
#subject to max_gebiete: sum{g in GEBIETE} Ausbau[g] -2 <= yMehrAlsZwei * 3;

#uncomment für Aufgabe b)
#Restriktion für genaue eine Vetreilstation, wenn yMehrAlsZwei = 1. Bemerkung: die Restriktion verteilstationMöglich Restriktion ist notwendig, da sonst die Verteilstation in E entsteht (E wird aber nicht gebaut).
#Es sollen nur Gebiete für die Verteilstation erwogen werden, die erschlossen sind. Da für Erschließung Gebiet D und E nur <= 2 Gebiete erschlossen werden, ist keine Verteilstation notwendig und die Lösung ist optimal. 
#subject to verteilstation: sum{g in GEBIETE} Verteilstation[g] >= yMehrAlsZwei * 1;
#subject to verteilstationMöglich {g in GEBIETE}: Ausbau[g] >= Verteilstation[g]; 
