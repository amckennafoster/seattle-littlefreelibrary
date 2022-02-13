# Method Notes

Notes to help clarify decisions in collecting data


## Comparison with public library

Collection dates by neighborhood with abreviations

Neighborhoods and Dates
- Central District - 28 April - 18 May (mgm and dth)
- Columbia City - 27 April (col)
- Queen Anne - 13 April (qna)
- Northgate - 20-22 April (nga)
- Laurelhurst - 4-9 May (net)
- Phinney-Greenwood - 5-19 May (gwd)
- Montlake - June 29, July 14 and July 19 (mon)
- Ravenna - June 30 (net)

Retrieved public library data for May from Central, Columbia, Queen Anne, Northgate, Laurelhust, and Phinney. Then public library data from July for Montlake, Ravenna.


## Spearman Correlation
This was appropriate for income, education level, and diversity across census tracts since the data were not normal and there were more than 10 observations for each. We removed census tracts that did not have at least one LFL- we were not testing if those factors influenced the *existence* of an LFL.

## Comparing Fiction/nonfiction and age level

Comparing neighborhoods using Chi Square is approporiate because the data are count values sampled from the population of LFL books. Comparing LFL to SPL statistically was beyond the expertise of the authors and we rely on visual inspection of the data to draw conclusions.
The counts from the public library are so large that any Chi square test is probably significant even with very small differences. We were also concerned that the counts from the public library were not samples of a larger population and using them in statistical tests my violate assumptions.
We did not consider the volume of the LFL here.

Decided to do post-hoc tests to indicate if the significant Chi square was due to one neighborhood pair or several.

## Creating pie charts of genre classifications

Want to compare proportions of genres if all the LFLs were the same size, i.e. 1 cubic foot. So raw counts should be summed by LFL and divided by the volume of that LFL giving a count per 1 cubic foot.
Otherwise, a large library filled with one genre could unduly influence the chart. If five LFLs had 90% history but there was one really big LFL full of children's books that made the overall percentage of history only 40%, visiting a random LFL of those six would most likely not show you what you expect (children's books).
Standardizing by volume would make this more accurate.

## Overview of Statistical tests

Total tests, including post-hoc = 64  (58 are post-hoc)

- Comparing fiction/nonfiction counts
 - Across neighborhoods: Chi square for the summed counts by neighborhood and post-hoc pair-wise chi squares (total tests 29)
 - Between transit and residential: Chi square of the summed counts for each group (total tests 1)
- Comparing juvenile vs adult book counts
 - Across neighborhoods: Chi square for the summed counts by neighborhood and post-hoc pair-wise chi squares (total tests 29)
 - Between transit and residential: Chi square of the summed counts for each group (total tests 1)
- Comparing the number of BIPOC authors across neighborhoods
 - Chi square for the number of books by BIPOC authors and those not by BIPOC (total tests 1)
- Number of LFLs per tract population
 - By education level: Spearman (total tests 1)
 - By Gini-Simpson diversity measure: Spearman (total tests 1)
 - By median income: Spearman (total tests 1)
 
 We used the Chi square test for independence because there are two or more variables and we don't know the expected distribution.
