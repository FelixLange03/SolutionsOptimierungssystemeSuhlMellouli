# Mengen:
set PRODUKTE;

# Parameter:
param stahl_max;
param arbeitsstunden_max;
param stahl {PRODUKTE};
param arbeitsstunden {PRODUKTE};
param deckungsbeitrag {PRODUKTE};

# Variablen:
var Make {PRODUKTE} >= 0;  # Anzahl der produzierten Einheiten
var Produce {PRODUKTE} binary;  # 1, wenn das Produkt produziert wird, sonst 0

# Zielfunktion:
maximize Total_Profit: sum {p in PRODUKTE} deckungsbeitrag[p] * Make[p];

# Restriktionen:
subject to Stahlrestriktion: 
    sum {p in PRODUKTE} stahl[p] * Make[p] <= stahl_max;

subject to Zeitrestriktion: 
    sum {p in PRODUKTE} arbeitsstunden[p] * Make[p] <= arbeitsstunden_max;

# Mindest- und Höchstgrenzen für Compact
subject to max_x1: Make["Compact"] <= 4000 * Produce["Compact"];
subject to min_x1: Make["Compact"] >= 1000 * Produce["Compact"];

# Mindest- und Höchstgrenzen für Midsize
subject to max_x2: Make["Midsize"] <= 2400 * Produce["Midsize"];
subject to min_x2: Make["Midsize"] >= 1000 * Produce["Midsize"];

# Mindest- und Höchstgrenzen für Large
subject to max_x3: Make["Large"] <= 1500 * Produce["Large"];
subject to min_x3: Make["Large"] >= 1000 * Produce["Large"];