proc import file="/home/u59513296/New Folder/FNT 105/Untitled form (Responses) XLS.xls"
out=PROTRADE
dbms=xls
replace;
getnames=yes;
run;
proc print data=PROTRADE;
run;

data new_data;
    set PROTRADE;
  
    Num_Age_Group = input(Age_Group, comma9.);
    drop Age_Group;
    format Num_Age_Group comma9.;
  
    Num_Income_Bracket_Monthly = input(Income_Bracket_Monthly, comma9.);
    drop Income_Bracket_Monthly;
    format Num_Income_Bracket_Monthly comma9.;
    
    
  Num_Trading_Platform = input(Trading_Platform, dollar19.);
    drop Trading_Platform;
    format Num_Trading_Platform dollar19.;
    
    Num_Reason_For_Use = input(Reason_For_Use, dollar32.);
    drop Reason_For_Use;
    format Num_Reason_for_Use dollar32.;
    
    Num_Risk_Capacity = input(Risk_Capacity, dollar18.);
    drop Risk_Capacity;
    format Num_Risk_Capacity dollar18.;
    
    Num_Income_Sources = input(Income_Sources, dollar18.);
    drop Income_Sources;
    format Num_Income_Sources dollar18.;
    
    Num_Trading_Period = input(Trading_Period, dollar32.);
    drop Trading_Period;
    format Num_Trading_Period dollar32.;
    
    Num_Preferred_Interactive_Feature = input(Preferred_Interactive_Feature, dollar64.);
    drop Preferred_Interactive_Feature;
    format Num_Preferred_Interactive_Feature dollar64.;
    
run;

proc contents data=new_data;
run;
proc freq data=PROTRADE;
table Age_Group Income_Bracket_Monthly Trading_Platform Risk_Capacity Income_Sources Trading_Period Preferred_Interactive_Feature;
run;
proc means data=new_data min max mean median mode skewness ;
run;
proc univariate data= new_data;
run;

PROC ANOVA DATA=PROTRADE;
CLASS Family_Income;
MODEL Sales_Transaction=Family_Income ;
RUN;