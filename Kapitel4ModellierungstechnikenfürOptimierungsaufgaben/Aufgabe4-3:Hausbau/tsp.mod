
# Mengen:
set HÄUSER;

# Parameter:
param deckungsbeitrag{HÄUSER};
param fläche{HÄUSER};
param fläche_max;

# Variablen:
var Make {HÄUSER} >= 0;  # Anzahl der gebauten Häuser
var Produce {HÄUSER} binary; # 1, wenn Haus bestimmter Art gebaut wird; relevant für Teilfrage b)
var yfamilie binary;
var yInfra binary;
# Zielfunktion:
maximize Gewinn: sum{h in HÄUSER} deckungsbeitrag[h] * Make[h] - 100000 * yfamilie;
# uncomment für Teilfrage d)
#maximize Gewinn: sum{h in HÄUSER} deckungsbeitrag[h] * Make[h] - (yInfra*(1000*Make["EF-HAUS"] + 1200*Make["DOPPELHAUS"] + 1400*Make["3F-HAUS"])) + (yInfra-1) * 150000 - 100000 * yfamilie;

# Restrictions:
subject to FlächenRestriktion: sum {h in HÄUSER} fläche[h] * Make[h] <= fläche_max;
subject to min_x1: Make["EF-HAUS"] >= 0.4 * (Make["EF-HAUS"] + Make["DOPPELHAUS"] + Make["3F-HAUS"]);

# uncomment für Teilfrage b)
# subject to schwelle_x2: Make["DOPPELHAUS"] >= 30 * Produce["DOPPELHAUS"];
# subject to max_x2: Make["DOPPELHAUS"] <= 9000 * Produce["DOPPELHAUS"]; 

# uncomment für Teilfrage c)
# subject to FamilienRestriktion: (Make["EF-HAUS"] + 2 * Make["DOPPELHAUS"] + 3 * Make["3F-HAUS"]) - 150 <= 112.5 * yfamilie;
# subject to schwelle_yfamilie: (Make["EF-HAUS"] + 2 * Make["DOPPELHAUS"] + 3 * Make["3F-HAUS"]) >= 150 * yfamilie;

# uncomment für Teilfrage d)
# subject to InfrastrukturRestriktion: (1000 * Make["EF-HAUS"] + 1200 * Make["DOPPELHAUS"] + 1400 * Make["3F-HAUS"]) - 150000 <= 112500 * yInfra;
# subject to schwelle_yInfra: (1000 * Make["EF-HAUS"] + 1200 * Make["DOPPELHAUS"] + 1400 * Make["3F-HAUS"]) >= 150000 * yInfra;
