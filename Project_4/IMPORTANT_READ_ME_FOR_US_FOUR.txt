

~~Dont forget to read the project feedback from canatta, a  text document in the main repo (As opposed to this text doc which is in project 4 folder)~~



Instructions to use median age and average income on tableau, FROM BRANDON:

When you run my query and load it into tableau, median age is an int but it appears it under dimensions and has values like "000018". To the actual numbers for median age, do this:

Analysis > new calculated field > > name it whatever you want > type "median age for zip code % 100" > click apply > click ok

Then in your measures you'll have the new calculated field which is the real median age.

If y'all use median age in R then hopefully it'll be read in correctly, if not might have to do the calculation in R (median age % 100 to get the actual median age)

Same deal for average income: make a calculated field of average income % 10000 to get the actual average income per zip code to use in insights or R