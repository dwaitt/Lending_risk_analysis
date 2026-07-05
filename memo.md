# Loan pricing isn't keeping up with risk

**Finding.** I looked at 1.35M completed LendingClub loans issued between 2007
and 2018 (about $18.5B in funded principal) and measured the net return per
dollar lent for each credit grade. If interest rates were pricing risk
correctly, riskier grades should earn more per dollar, since lenders demand
extra return for extra risk. The opposite happens: grade A returned +5.4% and
grade G returned -8.7%, and every grade below D lost money even at rates near
28%. The losses are also concentrated in specific segments. The single worst
was grade G debt consolidation loans in the lowest income quartile, which lost
about 17 cents per dollar. Some segments inside otherwise profitable grades lose
money too (C-grade medical and major purchase loans), so grade by itself
doesn't capture the risk.

![Net return by grade](charts/pricing_vs_risk.png)

**Recommendation.** Stop lending to, or re-price, the segments with negative
realized returns instead of cutting whole grades. The losing segments cluster
in grades E-G, in debt consolidation, and in the bottom two income quartiles.
Cutting at the grade level would drop profitable E segments while keeping C
segments that lose money.

**Expected impact.** The losing segments held 16.4% of funded volume and lost
about $78M across 2007-2018. Without them, portfolio net return would have been 4.2% instead of 3.1%,
roughly a third more profit per dollar lent. That's before
any upside from re-pricing instead of exiting.

**Why this isn't just 2008.** Looking only at 36-month E-G loans old enough to
have finished, default rates sat near 22% for the 2010-2013 vintages, then
climbed to 34% by 2015 while annual volume grew about 12x and rates barely
moved. The losses came from lending standards slipping during fast growth, not
from crisis-era loans.

**Caveats.** I only used completed loans, since loans still marked current in
2018 haven't had time to default. That's also why the vintage view stops at
2015 (later cohorts hadn't finished and would skew toward early defaults).
Recoveries are counted in returns. And LendingClub personal loans aren't credit
cards, so what carries over is the approach, not the exact numbers.