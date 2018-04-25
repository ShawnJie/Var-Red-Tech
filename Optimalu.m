function [ optimalu ] = Optimalu( x0,a,k,sigma,T,N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
lbd = -0.1;
rbd = 0;
popsize = 100;
m = ceil(log((rbd-lbd)/0.0001)/log(2));
Generation = 10000;
echgrate = 0.7;
mutrate = 0.2;

People = randi([0,1],[popsize,m]);
Realpeople = Uncoding(People,m,lbd,rbd);
Adaptvalue = Estimatevalue( Realpeople,popsize,x0,a,k,sigma,T,N );
for i = 1:Generation
    People = Newgeneration(People,Adaptvalue,echgrate,mutrate,popsize,m);
    Realpeople = Uncoding(People,m,lbd,rbd);
    Adaptvalue = Estimatevalue( Realpeople,popsize,x0,a,k,sigma,T,N );
end
[Maxvalue,Maxvalueposition] = max(Adaptvalue);
bestvalue = Maxvalue;
optimalu = Realpeople(Maxvalueposition);

end

