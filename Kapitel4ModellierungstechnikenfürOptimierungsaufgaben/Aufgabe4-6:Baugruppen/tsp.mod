
# Mengen:
set BAUGRUPPE;

# Parameter:
param ertrag{BAUGRUPPE};
param teilfertigung{BAUGRUPPE};
param vormontage{BAUGRUPPE};
param endmontage{BAUGRUPPE};
param teilfertigung_max;
param vormontage_max;
param endmontage_max;

# Variablen:
var Sell{BAUGRUPPE} >= 0;
var Make{BAUGRUPPE} >= 0;
var Produce{BAUGRUPPE} binary; #1, wenn Baugruppe hergestellt wird; 0, wenn nicht

# Zielfunktion:
maximize Gewinn: sum{b in BAUGRUPPE} Sell[b] * ertrag[b]; 

# Restriktionen für Minimalproduktion:
subject to max_x1: Make["P1"] <= 166*Produce["P1"];
subject to max_x2: Make["P2"] <= 70*Produce["P2"];
subject to min_x3: Make["P3"] <= 250*Produce["P3"];

subject to max_produce {b in BAUGRUPPE}: Make[b] >= 10*Produce[b];

subject to x3_requirement_x1: Sell["P1"] = Make["P1"] - Make["P3"];
subject to x3_requirement_x2: Sell["P2"] = Make["P2"] - Make["P3"];
subject to x3: Make["P3"] = Sell["P3"]; 

#Restriktionen für Maschinenstunden:
subject to teilfertigung_maximal: sum{b in BAUGRUPPE} Make[b]*teilfertigung[b] <= teilfertigung_max;
subject to vormontage_maximal: sum{b in BAUGRUPPE} Make[b]*vormontage[b] <= vormontage_max;
subject to endmontage_maximal: sum{b in BAUGRUPPE} Make[b]*endmontage[b] <= endmontage_max;
