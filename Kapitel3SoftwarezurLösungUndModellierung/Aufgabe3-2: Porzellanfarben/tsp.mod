# Sets
set FARBEN;  

# Parameters
param mischen_max;     
param abfüllen_max;       
param verpacken_max;    

param mischen {FARBEN};        
param abfüllen {FARBEN};
param verpacken {FARBEN};   
param contrib {FARBEN};
# Decision variables
var Make {FARBEN} >= 0;     # Quantity to produce for each product (non-negative)

# Objective: Maximize the total contribution margin
maximize Total_Profit:
    sum {f in FARBEN} contrib[f] * Make[f];

subject to MischenRestriktion:
    sum {f in FARBEN} mischen[f] * Make[f] <= mischen_max;

subject to AbfüllenRestriktion:
    sum {f in FARBEN} abfüllen[f] * Make[f] <= abfüllen_max;

subject to VerpackenRestriktion:
    sum {f in FARBEN} verpacken[f] * Make[f] <= verpacken_max;
