# Sets
set PROD;  # Set of products

# Parameters
param contrib {PROD};     # Contribution margin (€ per unit)
param labor {PROD};       # Labor required (minutes per unit)
param material {PROD};    # Raw material required (units per unit)

param labor_avail;        # Total available labor (minutes)
param material_avail;     # Total available raw materials (units)

# Decision variables
var Make {PROD} >= 0;     # Quantity to produce for each product (non-negative)

# Objective: Maximize the total contribution margin
maximize Total_Profit:
    sum {p in PROD} contrib[p] * Make[p];

# Labor constraint
subject to Labor:
    sum {p in PROD} labor[p] * Make[p] <= labor_avail;

# Raw material constraint
subject to Material:
    sum {p in PROD} material[p] * Make[p] <= material_avail;

# #Minimum production requirement for Product 1
# #uncomment this to ensure x1 is produced once.
# subject to Min_Prod_1:
#     Make["PROD 1"] >= 1;
# #uncomment this to ensure x1 is produced once.
