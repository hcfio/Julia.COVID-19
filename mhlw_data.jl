# mhlw_data.jl
#######################

# Load packages. 
using Plots, CSV, Dates, HTTP, DataFrames

# Download data from the MHLW web site. 
download("https://www.mhlw.go.jp/content/pcr_positive_daily.csv","pcr_positive_daily.csv");
download("https://www.mhlw.go.jp/content/recovery_total.csv","recovery_total.csv");

# Shape up the data.
# N: the number of days 
# A[n]: total cases on the n-th day
# B[n]: the number of total discharged individuals on the n-the day
# C[n]=A[n]-B[n]: active cases and deaths  
Acsv=DataFrame(CSV.File("pcr_positive_daily.csv", header=false, delim=','));
Bcsv=DataFrame(CSV.File("recovery_total.csv", header=false, delim=','));
(pa,qa)=size(Acsv);
AA=parse.(Float64,Acsv[2:pa,2]);
(pb,qb)=size(Bcsv);
BB=parse.(Float64,Bcsv[2:pb,2]);
aa=length(AA);
bb=length(BB);
N=aa-16;
A=zeros(N);
B=zeros(N);
A17=zeros(17);
A17[1]=AA[1];
for l=2:17
    A17[l]=AA[l]+A17[l-1];
end
A[1]=A17[17];
for k=2:N
    A[k]=AA[16+k]+A[k-1];
end
for k=1:N
    B[k]=BB[k+3];
end
C=A-B;

n=aa-320;
r=zeros(n);
for k=1:n
    r[k,1]=C[k+304,1]/C[k+303,1];
end
s=ones(n);
b1=2^(1/7)*s;
b2=2^(1/14)*s;
b4=2^(1/28)*s;

# Plot the data
# d0: the initial date
# d0+Day(N-1): the date of update.
d0=Date(2020,2,1);
l0=string(d0);
l1=string(d0+Day(Int(floor((N-1)/3))));
l2=string(d0+Day(Int(floor(2*(N-1)/3))));
l3=string(d0+Day(N-1));
plot([A B C], 
    grid=false,
    linewidth=3, 
    title="COVID-19 in Japan (126M) \n data sourced by Japanese Ministry of Health", 
    xlabel="date",
    yaxis="cases",
    legendfont=font(14), 
    label=["total cases" "discharged" "active cases"], 
    legend = :topleft)
plot!(xticks = ([0 floor((N-1)/3)  floor(2*(N-1)/3) N-3;], [l0 l1 l2 l3]))
savefig("mhlw_data.png") 

dd0=Date(2020,12,1)
ll0=string(dd0);
ll1=string(dd0+Day(Int(floor((n-1)/3))));
ll2=string(dd0+Day(Int(floor(2*(n-1)/3))));
ll3=string(dd0+Day(n-2));
plot([r s b1 b2 b4], 
    grid=false,
    linewidth=3, 
    title="COVID-19 in Japan (126M) I(t)/I(t-1) \n data sourced by Japanese Ministry of Health", 
    xlabel="date t",
    yaxis="ratio",
    legendfont=font(14), 
    label=["I(t)/I(t-1)" "1" "2^(1/7)" "2^(1/14)" "2^(1/28)"], 
    legend = :topleft)
plot!(xticks = ([1 floor((n-1)/3)  floor(2*(n-1)/3) n-1;], [ll0 ll1 ll2 ll3]))
savefig("mhlw_ratio.png") 