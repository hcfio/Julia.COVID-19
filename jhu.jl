# jhu.jl
#######################

# Load packages. 
using Plots, CSV, Dates, DataFrames

# Download data from the MHLW web site. 
download("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv","./csv/jhu_cases.csv");
download("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv","./csv/jhu_deaths.csv");
download("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv","./csv/jhu_recovered.csv");

Acsv=DataFrame(CSV.File("./csv/jhu_cases.csv", header=false, delim=','));
Bcsv=DataFrame(CSV.File("./csv/jhu_deaths.csv", header=false, delim=','));
Ccsv=DataFrame(CSV.File("./csv/jhu_recovered.csv", header=false, delim=','));
(pw,qw)=size(Acsv);

D=Int64(qw-4);
d0=Date(2020,1,22);
d1=d0+Day(D-1);
l0=string(d0);
l1=string(d0+Day(Int(floor((D-1)/4))));
l2=string(d0+Day(Int(floor((D-1)/2))));
l3=string(d0+Day(Int(floor(3*(D-1)/4))));
l4=string(d0+Day(D-1));
DD=Int64(D-526);
dd0=Date(2021,7,1);
dd1=d0+Day(DD-1);
ll0=string(dd0);
ll1=string(dd0+Day(Int(floor((DD-1)/2))));
ll2=string(dd0+Day(DD-1));


# Argentina
PARG=45.670451;
AARG=parse.(Float64,Array(Acsv[8,5:qw]))/PARG;
NARG=zeros(D);
for j=1:7
    NARG[j]=AARG[j]/7
end
for j=8:D
    NARG[j]=(AARG[j]-AARG[j-7])/7
end
BARG=parse.(Float64,Array(Bcsv[8,5:qw]))/PARG;
NDARG=zeros(D);
for j=1:7
    NDARG[j]=BARG[j]/7
end
for j=8:D
    NDARG[j]=(BARG[j]-BARG[j-7])/7
end

# Bangladesh
PBGD=166.567052;
ABGD=parse.(Float64,Array(Acsv[22,5:qw]))/PBGD;
NBGD=zeros(D);
for j=1:7
    NBGD[j]=ABGD[j]/7
end
for j=8:D
    NBGD[j]=(ABGD[j]-ABGD[j-7])/7
end
BBGD=parse.(Float64,Array(Bcsv[22,5:qw]))/PBGD;
NDBGD=zeros(D);
for j=1:7
    NDBGD[j]=BBGD[j]/7
end
for j=8:D
    NDBGD[j]=(BBGD[j]-BBGD[j-7])/7
end

# Brazil 
PBRA=214.289417;
ABRA=parse.(Float64,Array(Acsv[32,5:qw]))/PBRA;
NBRA=zeros(D);
for j=1:7
    NBRA[j]=ABRA[j]/7
end
for j=8:D
    NBRA[j]=(ABRA[j]-ABRA[j-7])/7
end
BBRA=parse.(Float64,Array(Bcsv[32,5:qw]))/PBRA;
NDBRA=zeros(D);
for j=1:7
    NDBRA[j]=BBRA[j]/7
end
for j=8:D
    NDBRA[j]=(BBRA[j]-BBRA[j-7])/7
end

# Colombia 
PCOL=51.503463;
ACOL=parse.(Float64,Array(Acsv[94,5:qw]))/PCOL;
NCOL=zeros(D);
for j=1:7
    NCOL[j]=ACOL[j]/7
end
for j=8:D
    NCOL[j]=(ACOL[j]-ACOL[j-7])/7
end
BCOL=parse.(Float64,Array(Bcsv[94,5:qw]))/PCOL;
NDCOL=zeros(D);
for j=1:7
    NDCOL[j]=BCOL[j]/7
end
for j=8:D
    NDCOL[j]=(BCOL[j]-BCOL[j-7])/7
end

# France Italy Spain 
PFRA=65.439014;
PITA=60.359899;
PESP=46.775535;
PFIE=PFRA+PITA+PESP;
CFRA=parse.(Float64,Array(Acsv[132,5:qw]));
CITA=parse.(Float64,Array(Acsv[155,5:qw]));
CESP=parse.(Float64,Array(Acsv[239,5:qw]));
AFIE=(CFRA+CITA+CESP)/PFIE;
NFIE=zeros(D);
for j=1:7
    NFIE[j]=AFIE[j]/7
end
for j=8:D
    NFIE[j]=max(0,(AFIE[j]-AFIE[j-7])/7)
end
DFRA=parse.(Float64,Array(Bcsv[132,5:qw]))
DITA=parse.(Float64,Array(Bcsv[155,5:qw]));
DESP=parse.(Float64,Array(Bcsv[239,5:qw]));
BFIE=(DFRA+DITA+DESP)/PFIE;
NDFIE=zeros(D);
for j=1:7
    NDFIE[j]=BFIE[j]/7
end
for j=8:D
    NDFIE[j]=(BFIE[j]-BFIE[j-7])/7
end

# India 
PIND=1395.531433;
AIND=parse.(Float64,Array(Acsv[149,5:qw]))/PIND;
NIND=zeros(D);
for j=1:7
    NIND[j]=AIND[j]/7
end
for j=8:D
    NIND[j]=(AIND[j]-AIND[j-7])/7
end
BIND=parse.(Float64,Array(Bcsv[149,5:qw]))/PIND;
NDIND=zeros(D);
for j=1:7
    NDIND[j]=BIND[j]/7
end
for j=8:D
    NDIND[j]=(BIND[j]-BIND[j-7])/7
end

# Indonesia
PIDN=276.833206;
AIDN=parse.(Float64,Array(Acsv[150,5:qw]))/PIDN;
NIDN=zeros(D);
for j=1:7
    NIDN[j]=AIDN[j]/7
end
for j=8:D
    NIDN[j]=(AIDN[j]-AIDN[j-7])/7
end
BIDN=parse.(Float64,Array(Bcsv[150,5:qw]))/PIDN;
NDIDN=zeros(D);
for j=1:7
    NDIDN[j]=BIDN[j]/7
end
for j=8:D
    NDIDN[j]=(BIDN[j]-BIDN[j-7])/7
end

# Japan
PJPN=126.032481;
AJPN=parse.(Float64,Array(Acsv[157,5:qw]))/PJPN;
NJPN=zeros(D);
for j=1:7
    NJPN[j]=AJPN[j]/7
end
for j=8:D
    NJPN[j]=(AJPN[j]-AJPN[j-7])/7
end
BJPN=parse.(Float64,Array(Bcsv[157,5:qw]))/PJPN;
NDJPN=zeros(D);
for j=1:7
    NDJPN[j]=BJPN[j]/7
end
for j=8:D
    NDJPN[j]=(BJPN[j]-BJPN[j-7])/7
end

# South Korea
PKOR=51.319753;
AKOR=parse.(Float64,Array(Acsv[162,5:qw]))/PKOR;
NKOR=zeros(D);
for j=1:7
    NKOR[j]=AKOR[j]/7
end
for j=8:D
    NKOR[j]=(AKOR[j]-AKOR[j-7])/7
end
BKOR=parse.(Float64,Array(Bcsv[162,5:qw]))/PKOR;
NDKOR=zeros(D);
for j=1:7
    NDKOR[j]=BKOR[j]/7
end
for j=8:D
    NDKOR[j]=(BKOR[j]-BKOR[j-7])/7
end

# Malaysia
PMYS=32.7;
AMYS=parse.(Float64,Array(Acsv[178,5:qw]))/PMYS;
NMYS=zeros(D);
for j=1:7
    NMYS[j]=AMYS[j]/7
end
for j=8:D
    NMYS[j]=(AMYS[j]-AMYS[j-7])/7
end
BMYS=parse.(Float64,Array(Bcsv[178,5:qw]))/PMYS;
NDMYS=zeros(D);
for j=1:7
    NDMYS[j]=BMYS[j]/7
end
for j=8:D
    NDMYS[j]=(BMYS[j]-BMYS[j-7])/7
end

# Mexico 
PMEX=130.482814;
AMEX=parse.(Float64,Array(Acsv[185,5:qw]))/PMEX;
NMEX=zeros(D);
for j=1:7
    NMEX[j]=AMEX[j]/7
end
for j=8:D
    NMEX[j]=(AMEX[j]-AMEX[j-7])/7
end
BMEX=parse.(Float64,Array(Bcsv[185,5:qw]))/PMEX;
NDMEX=zeros(D);
for j=1:7
    NDMEX[j]=BMEX[j]/7
end
for j=8:D
    NDMEX[j]=(BMEX[j]-BMEX[j-7])/7
end

# Nepal
PNPL=29.735589;
ANPL=parse.(Float64,Array(Acsv[194,5:qw]))/PNPL;
NNPL=zeros(D);
for j=1:7
    NNPL[j]=ANPL[j]/7
end
for j=8:D
    NNPL[j]=(ANPL[j]-ANPL[j-7])/7
end
BNPL=parse.(Float64,Array(Bcsv[194,5:qw]))/PNPL;
NDNPL=zeros(D);
for j=1:7
    NDNPL[j]=BNPL[j]/7
end
for j=8:D
    NDNPL[j]=(BNPL[j]-BNPL[j-7])/7
end

# Pakistan 205 190
PPAK=225.791619;
APAK=parse.(Float64,Array(Acsv[208,5:qw]))/PPAK;
NPAK=zeros(D);
for j=1:7
    NPAK[j]=APAK[j]/7
end
for j=8:D
    NPAK[j]=(APAK[j]-APAK[j-7])/7
end
BPAK=parse.(Float64,Array(Bcsv[208,5:qw]))/PPAK;
NDPAK=zeros(D);
for j=1:7
    NDPAK[j]=BPAK[j]/7
end
for j=8:D
    NDPAK[j]=(BPAK[j]-BPAK[j-7])/7
end

# Philippines
PPHI=111.249116;
APHI=parse.(Float64,Array(Acsv[214,5:qw]))/PPHI;
NPHI=zeros(D);
for j=1:7
    NPHI[j]=APHI[j]/7
end
for j=8:D
    NPHI[j]=(APHI[j]-APHI[j-7])/7
end
BPHI=parse.(Float64,Array(Bcsv[214,5:qw]))/PPHI;
NDPHI=zeros(D);
for j=1:7
    NDPHI[j]=BPHI[j]/7
end
for j=8:D
    NDPHI[j]=(BPHI[j]-BPHI[j-7])/7
end

# Sri Lanka 
PLKA=21.516097;
ALKA=parse.(Float64,Array(Acsv[240,5:qw]))/PLKA;
NLKA=zeros(D);
for j=1:7
    NLKA[j]=ALKA[j]/7
end
for j=8:D
    NLKA[j]=(ALKA[j]-ALKA[j-7])/7
end
BLKA=parse.(Float64,Array(Bcsv[240,5:qw]))/PLKA;
NDLKA=zeros(D);
for j=1:7
    NDLKA[j]=BLKA[j]/7
end
for j=8:D
    NDLKA[j]=(BLKA[j]-BLKA[j-7])/7
end

# Thailand
PTHA=70.000662;
ATHA=parse.(Float64,Array(Acsv[250,5:qw]))/PTHA;
NTHA=zeros(D);
for j=1:7
    NTHA[j]=ATHA[j]/7
end
for j=8:D
    NTHA[j]=(ATHA[j]-ATHA[j-7])/7
end
BTHA=parse.(Float64,Array(Bcsv[250,5:qw]))/PTHA;
NDTHA=zeros(D);
for j=1:7
    NDTHA[j]=BTHA[j]/7
end
for j=8:D
    NDTHA[j]=(BTHA[j]-BTHA[j-7])/7
end

# United Staes 
PUSA=333.225477;
AUSA=parse.(Float64,Array(Acsv[256,5:qw]))/PUSA;
NUSA=zeros(D);
for j=1:7
    NUSA[j]=AUSA[j]/7
end
for j=8:D
    NUSA[j]=(AUSA[j]-AUSA[j-7])/7
end
BUSA=parse.(Float64,Array(Bcsv[256,5:qw]))/PUSA;
NDUSA=zeros(D);
for j=1:7
    NDUSA[j]=BUSA[j]/7
end
for j=8:D
    NDUSA[j]=(BUSA[j]-BUSA[j-7])/7
end

# United Kingdom 
PGBR=68.294438;
AGBR=parse.(Float64,Array(Acsv[271,5:qw]))/PGBR;
NGBR=zeros(D);
for j=1:7
    NGBR[j]=AGBR[j]/7
end
for j=8:D
    NGBR[j]=(AGBR[j]-AGBR[j-7])/7
end
BGBR=parse.(Float64,Array(Bcsv[271,5:qw]))/PGBR;
NDGBR=zeros(D);
for j=1:7
    NDGBR[j]=BGBR[j]/7
end
for j=8:D
    NDGBR[j]=(BGBR[j]-BGBR[j-7])/7
end

p1=plot([AJPN APHI AMYS AIDN AIND ANPL APAK ABGD ALKA ATHA],  
    grid=false,
    linewidth=2, 
    title="COVID-19: cases per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 10.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xlabel="date",
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    yaxis="cases/1M",
    legendfont=font(10), 
    label=["Japan" "Philippines" "Malaysia" "Indonesia" "India" "Nepal" "Pakistan" "Bangladesh" "Sri Lanka" "Thailand"],
    palette = :seaborn_bright, 
    legend = :topleft)
savefig("./jhu/jhu_asia_cases.png") 

p2=plot([BJPN BPHI BMYS BIDN BIND BNPL BPAK BBGD BLKA BTHA], 
    grid=false,
    linewidth=2, 
    title="COVID-19: deaths per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 10.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    xlabel="date",
    yaxis="deaths/1M",
    legendfont=font(10), 
    label=["Japan" "Philippines" "Malaysia" "Indonesia" "India" "Nepal" "Pakistan" "Bangladesh" "Sri Lanka" "Thailand"],
   palette = :seaborn_bright, 
     legend = :topleft)
savefig("./jhu/jhu_asia_deaths.png") 

p3=plot([NJPN NPHI NMYS NIDN NIND NNPL NPAK NBGD NLKA NTHA],  
    grid=false,
    linewidth=2, 
    title="COVID-19: 7-day average of new cases per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 10.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xlabel="date",
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    yaxis="cases/1M",
    legendfont=font(10), 
    label=["Japan" "Philippines" "Malaysia" "Indonesia" "India" "Nepal" "Pakistan" "Bangladesh" "Sri Lanka" "Thailand"],
    palette = :seaborn_bright, 
    legend = :topleft)
savefig("./jhu/jhu_asia_new_cases.png") 

p4=plot([NDJPN NDPHI NDMYS NDIDN NDIND NDNPL NDPAK NDBGD NDLKA NDTHA],  
    grid=false,
    linewidth=2, 
    title="COVID-19: 7-day average deaths per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 10.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    xlabel="date",
    yaxis="deaths/1M",
    legendfont=font(10), 
    label=["Japan" "Philippines" "Malaysia" "Indonesia" "India" "Nepal" "Pakistan" "Bangladesh" "Sri Lanka" "Thailand"],
   palette = :seaborn_bright, 
     legend = :topleft)
savefig("./jhu/jhu_asia_recent_deaths.png") 

p5=plot([AUSA AGBR AARG ABRA ACOL AMEX AFIE],  
    grid=false,
    linewidth=2, 
    title="COVID-19: cases per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 15.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    xlabel="date",
    yaxis="cases/1M",
    legendfont=font(10), 
    label=["United States" "United Kingdom" "Argentina" "Brazil" "Colombia" "Mexico" "FRA+ITA+ESP"],
    palette = :seaborn_bright, 
    legend = :topleft)

p6=plot([BUSA BGBR BARG BBRA BCOL BMEX BFIE],  
    grid=false,
    linewidth=2, 
    title="COVID-19: deaths per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 10.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    xlabel="date",
    yaxis="deaths/1M",
    legendfont=font(10), 
    label=["United States" "United Kingdom" "Argentina" "Brazil" "Colombia" "Mexico" "FRA+ITA+ESP"],
    palette = :seaborn_bright, 
    legend = :topleft)

p7=plot([NUSA NGBR NARG NBRA NCOL NMEX NFIE],  
    grid=false,
    linewidth=2, 
    title="COVID-19: 7-day-average of new cases per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 10.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    xlabel="date",
    yaxis="cases/1M",
    legendfont=font(10), 
    label=["United States" "United Kingdom" "Argentina" "Brazil" "Colombia" "Mexico" "FRA+ITA+ESP"],
    palette = :seaborn_bright, 
    legend = :topleft)

p8=plot([NDUSA NDGBR NDARG NDBRA NDCOL NDMEX NDFIE],  
    grid=false,
    linewidth=2, 
    title="COVID-19: 7-day average deaths per 1M \n data sourced by JHU Coronavirus Resource Center", 
    right_margin=Plots.Measures.Length(:mm, 10.0),
    left_margin=Plots.Measures.Length(:mm, 5.0),
    xticks = ([1 floor(D/4)  floor(D/2) floor(3*D/4) D;], [l0 l1 l2 l3 l4]),
    xlabel="date",
    yaxis="deaths/1M",
    legendfont=font(10), 
    label=["United States" "United Kingdom" "Argentina" "Brazil" "Colombia" "Mexico" "FRA+ITA+ESP"],
   palette = :seaborn_bright, 
     legend = :topleft)

plot(p1, p2, p3, p4,
     layout=(2,2), 
     size=(1200,800), 
     left_margin=Plots.Measures.Length(:mm, 5.0),
     right_margin=Plots.Measures.Length(:mm, 15.0),
     top_margin=Plots.Measures.Length(:mm, 5.0),
     bottom_margin=Plots.Measures.Length(:mm, 5.0))
savefig("./jhu/jhu_asia.png") 

plot(p5, p6, p7, p8,
     layout=(2,2), 
     size=(1200,800), 
     left_margin=Plots.Measures.Length(:mm, 5.0),
     right_margin=Plots.Measures.Length(:mm, 15.0),
     top_margin=Plots.Measures.Length(:mm, 5.0),
     bottom_margin=Plots.Measures.Length(:mm, 5.0))
savefig("./jhu/jhu_world.png") 
