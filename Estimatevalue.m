function [ Value ] = Estimatevalue( Realpeople,popsize,x0,a,k,sigma,T,N )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

X = ones(popsize,N+1) * x0;
h = T/N;
for i=1:N
    X(:,i+1) = (sigma/2*Realpeople+X(:,i).^(1/2)+((sigma/2*Realpeople+X(:,i).^(1/2)).^2+4*(1+k*h/2)*(a-sigma^2/4)/2*h).^(1/2)).^2/4/(1+k*h/2).^2;
end 
Value = -h*sum(X(:,2:N+1),2)-N*(Realpeople.^2)/2;
end

