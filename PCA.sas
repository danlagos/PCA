/* ANA 630:  Homework - Week 1 */
/* Daniel Lagos*/

/* Bring in your data */
libname s '/home/u61014676/ANA 630/Data';
data hm1; set s.adult; run;
proc contents data=hm1;

/* 	variables identified as candidates that may represent the follwing factors:
	General Health, Diabetes, heart disease
*/
%let allVar = 	AB1 AB22 AB24 AB25 AB29 AB30 AB34 AB51 AB52 
				AB81 AB99 AB109 AB111 AB115 AB117 AB118 AB119 
				AB120 AB122 AB123 AB124 AH12 SRSEX AF63 AF64 
				AF65 AF66 AF67 AF68;

/* Check data for cleanliness */
proc univariate data=hm1;
	var &allVar;
run;

proc corr data=hm1 best=20 noprob;
	var &allVar;
run;

/* new varbles after correlation analysis */
%let newVar = 	AB22 AB24 AB25 AB34 AB51 AB52 
				AB109 AB111 AB115 AB117 AB118 AB119 
				AB120 AB122 AB123 AB124 AF63 AF64 
				AF65 AF66 AF67 AF68;


/* negative values:  it seems that -1 means unaplicable.  */
proc means data=hm1 min max mean std n nmiss;
	var &newVar;
run;

proc freq data=hm1;
	tables &newVar;
run;

/* 	fix data, get rid of values of -2: they mean missing proxy 
	turn values of -1 to 0.  -1 = inapplicable in original dataset
*/

data hm1; set hm1;
	where AB120 >= -1;
	
	If AB24 = -1 then AB24 = 0;
	If AB24 = 1 then AB24 = 1;
	If AB24 = 2 then AB24 = 2;
	
	If AB25 = -1 then AB25 = 0;
	If AB25 = 1 then AB25 = 1;
	If AB25 = 2 then AB25 = 2;
	
	If AB30 = -1 then AB30 = 0;
	If AB30 = 1 then AB30 = 1;
	If AB30 = 2 then AB30 = 2;
	
	If AB51 = -1 then AB51 = 0;
	If AB51 = 1 then AB51 = 1;
	If AB51 = 2 then AB51 = 2;
	If AB51 = 3 then AB51 = 3;
	
	If AB52 = -1 then AB52 = 0;
	If AB52 = 1 then AB52 = 1;
	If AB52 = 2 then AB52 = 2;
	
	If AB81 = -1 then AB81 = 0;
	If AB81 = 1 then AB81 = 1;
	If AB81 = 2 then AB81 = 2;
	If AB81 = 3 then AB81 = 3;
	
	If AB99 = -1 then AB99 = 0;
	If AB99 = 1 then AB99 = 1;
	If AB99 = 2 then AB99 = 2;
	
	/* here */
	If AB109 = -1 then AB109 = 0;
	If AB109 = 1 then AB109 = 1;
	If AB109 = 2 then AB109 = 2;
	
	If AB111 = -1 then AB111 = 0;
	If AB111 = 1 then AB111 = 1;
	If AB111 = 2 then AB111 = 2;
	
	If AB115 = -1 then AB115 = 0;
	If AB115 = 1 then AB115 = 1;
	If AB115 = 2 then AB115 = 2;
	
	If AB117 = -1 then AB117 = 0;
	If AB117 = 1 then AB117 = 1;
	If AB117 = 2 then AB117 = 2;
	
	If AB118 = -1 then AB118 = 0;
	If AB118 = 1 then AB118 = 1;
	If AB118 = 2 then AB118 = 2;
	
	If AB119 = -1 then AB119 = 0;
	If AB119 = 1 then AB119 = 1;
	If AB119 = 2 then AB119 = 2;
	
	If AB120 = -1 then AB120 = 0;
	If AB120 = 1 then AB120 = 1;
	If AB120 = 2 then AB120 = 2;
	If AB120 = 3 then AB120 = 3;
	If AB120 = 4 then AB120 = 4;
	
	If AB122 = -1 then AB122 = 0;
	If AB122 = 1 then AB122 = 1;
	If AB122 = 2 then AB122 = 2;
	
	If AB123 = -1 then AB123 = 0;
	If AB123 = 1 then AB123 = 1;
	If AB123 = 2 then AB123 = 2;
	
	If AB124 = -1 then AB124 = 0;
	If AB124 = 1 then AB124 = 1;
	If AB124 = 2 then AB124 = 2;
	
	If AH12 = -1 then AH12 = 0;
	If AH12 = 1 then AH12 = 1;
	If AH12 = 2 then AH12 = 2;
	
	If AF63 = -1 then AF63 = 0;
	If AF63 = 1 then AF63 = 1;
	If AF63 = 2 then AF63 = 2;
	If AF63 = 3 then AF63 = 3;
	If AF63 = 4 then AF63 = 4;
	If AF63 = 5 then AF63 = 5;
	
	If AF64 = -1 then AF64 = 0;
	If AF64 = 1 then AF64 = 1;
	If AF64 = 2 then AF64 = 2;
	If AF64 = 3 then AF64 = 3;
	If AF64 = 4 then AF64 = 4;
	If AF64 = 5 then AF64 = 5;

	If AF65 = -1 then AF65 = 0;
	If AF65 = 1 then AF65 = 1;
	If AF65 = 2 then AF65 = 2;
	If AF65 = 3 then AF65 = 3;
	If AF65 = 4 then AF65 = 4;
	If AF65 = 5 then AF65 = 5;

	If AF66 = -1 then AF66 = 0;
	If AF66 = 1 then AF66 = 1;
	If AF66 = 2 then AF66 = 2;
	If AF66 = 3 then AF66 = 3;
	If AF66 = 4 then AF66 = 4;
	If AF66 = 5 then AF66 = 5;
	
	If AF67 = -1 then AF67 = 0;
	If AF67 = 1 then AF67 = 1;
	If AF67 = 2 then AF67 = 2;
	If AF67 = 3 then AF67 = 3;
	If AF67 = 4 then AF67 = 4;
	If AF67 = 5 then AF67 = 5;
	
	If AF68 = -1 then AF68 = 0;
	If AF68 = 1 then AF68 = 1;
	If AF68 = 2 then AF68 = 2;
	If AF68 = 3 then AF68 = 3;
	If AF68 = 4 then AF68 = 4;
	If AF68 = 5 then AF68 = 5;

run;

/* Checking for mistakes:  good to go*/
proc contents data=hm1;
proc freq data=hm1;
	tables &newVar;
run;

/* Factor Analysis*/
ods noproctitle;
ods graphics / imagemap=on;
title '22 Factors';
proc factor data=hm1 simple method=principal rotate=varimax nfactors=22
		norm=kaiser plots=(scree) fuzz=0.3;
	var &newVar;
	pathdiagram;
run;

ods noproctitle;
ods graphics / imagemap=on;
title '3 Factors';
proc factor data=hm1 simple method=principal rotate=varimax nfactors=3
		norm=kaiser plots=(scree) fuzz=0.3;
	var &newVar;
	pathdiagram;
run;

/* Cody assignment*/
data principal;
	do SUBJ = 1 to 200;
		X1 = round(rannor(123)*50 + 500);
		X2 = round(rannor(123)*50 + 100 + 0.8*X1);
		X3 = round(rannor(123)*50 + 100 + X1 - 0.5*X2);
		X4 = round(rannor(123)*50 + 0.3*X1 + 0.3*X2 + 0.3*X3);
		OUTPUT;
	END;
run;

proc contents data=principal;

ods noproctitle;
ods graphics / imagemap=on;
title 'Cody Assignment';
proc factor data=principal simple method=principal rotate=varimax nfactors=4
		norm=kaiser plots=(scree) fuzz=0.3;
	var X1 X2 X3 X4;
	pathdiagram;
run;

ods noproctitle;
ods graphics / imagemap=on;
title 'Cody Assignment - 2 factors';
proc factor data=principal simple method=principal rotate=varimax nfactors=2
		norm=kaiser plots=(scree) fuzz=0.3;
	var X1 X2 X3 X4;
	pathdiagram;
run;