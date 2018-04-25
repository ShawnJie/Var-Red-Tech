function [ bond_price ] = CIR_anti(  x0,a,k,sigma,T,N,M )
%This function prices a zero-coupon bond with implicit discretizaiton
%scheme of CIR model and antithetic monte carlo methods
%  CIR model:dXt = (a-k*Xt)dt + sigma*sqrt(Xt)dWt,  0<=t<=T
%  Parameters: x0,a,sigma>0, k belongs to R, 2a/sigma^2>1
%  N is discrete points numbers and M is paths numbers.

h = T/N; %Time step.
W1 = randn(M/2,N) .* h^(1/2); %Only generate half numbers of B.M. paths.
W = [W1;-W1]; %The other half is antithetic.

%Generates rate processes
X = ones(M,N+1) * x0;
for i=1:N
    X(:,i+1) = (sigma/2*W(:,i)+X(:,i).^(1/2)+((sigma/2*W(:,i)+X(:,i).^(1/2)).^2+4*(1+k*h/2)*(a-sigma^2/4)/2*h).^(1/2)).^2/4/(1+k*h/2).^2;
end

bond = exp(-h*sum(X(:,2:N+1),2)); %Gaussian Rate Model
bond_price = mean(bond);

end

