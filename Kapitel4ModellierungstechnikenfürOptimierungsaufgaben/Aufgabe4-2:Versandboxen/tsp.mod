
# Mengen:
set BOXEN;

# Parameter:
param variableKosten{BOXEN};
param fixeKosten{BOXEN};

# Variablen:
var Make {BOXEN} >= 0;  # Anzahl der produzierten Einheiten
var Produce {BOXEN} binary;  # 1, wenn das Produkt produziert wird, sonst 0

# Zielfunktion:
minimize Kosten: sum {b in BOXEN} (variableKosten[b] * Make[b] + fixeKosten[b] * Produce[b]);

# Restriktionen für größte Box:
subject to max_x1: Make["x1"] <= 27000 * Produce["x1"];
subject to min_x1: Make["x1"] >= 4000;

# Restriktionen für restliche Boxen (absteigend) x1 kann den gesamten Bedarf decken; x2 nur den Bedarf von x2-x7
subject to max_x2: Make["x2"] <= 23000 * Produce["x2"];
subject to max_x3: Make["x3"] <= 20000 * Produce["x3"];
subject to max_x4: Make["x4"] <= 15000 * Produce["x4"];
subject to max_x5: Make["x5"] <= 8000 * Produce["x5"];
subject to max_x6: Make["x6"] <= 6000 * Produce["x6"];
subject to max_x7: Make["x7"] <=2000 * Produce["x7"];

# Restriktionen für mögliche Bedarfsdeckungen; der Bedarf von x2 kann (und muss) von x1 und x2 gemeinsam gedeckt werden
subject to min_x1_x2: Make["x1"] + Make["x2"] >= 7000;
subject to min_x1_x2_x3: Make["x1"] + Make["x2"] + Make["x3"] >= 12000;
subject to min_x1_x2_x3_x4: Make["x1"] + Make["x2"] + Make["x3"] + Make["x4"] >= 19000;
subject to min_x1_x2_x3_x4_x5: Make["x1"] + Make["x2"] + Make["x3"] + Make["x4"] + Make["x5"] >= 21000;
subject to min_x1_x2_x3_x4_x5_x6: Make["x1"] + Make["x2"] + Make["x3"] + Make["x4"] + Make["x5"] + Make["x6"] >= 25000;
subject to min_x1_x2_x3_x4_x5_x6_x7: Make["x1"] + Make["x2"] + Make["x3"] + Make["x4"] + Make["x5"] + Make["x6"] + Make["x7"] >= 27000;
