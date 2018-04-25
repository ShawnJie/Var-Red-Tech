clear;
x0 = 1;
a = 1;
k = 1;
sigma = 0.5;
T = 1;

N = 100; %N is the number of discrete points
M = 10000; %M is path number of every simulation
L = 1000;  %L is the number of simulation
simu_results = zeros(4,L); %Matrix stored simulation results.
time = zeros(4,L);%Vector stored simulation time of 3 methods.

tstart = tic;
u = Optimalu(x0,a,k,sigma,T,N);
addtiontime = toc(tstart);

for j = 1:L
% Plain Monte Carlo 
% Results and time are stored in the 1st row of simu_results and time.
    tstart = tic;
    simu_results(1,j) = CIR_plain(x0,a,k,sigma,T,N,M);
    time(1,j) = toc(tstart);

% Latin Hypercube Sampling Monte Carlo 
% Results and time are stored in the 2nd row of simu_results and time.
    tstart = tic;
    simu_results(2,j) = CIR_lhs(x0,a,k,sigma,T,N,M);
    time(2,j) = toc(tstart);

% Antithetic Monte Carlo 
% Results and time are stored in the 3rd row of simu_results and time.
    tstart = tic;
    simu_results(3,j) = CIR_anti(x0,a,k,sigma,T,N,M);
    time(3,j) = toc(tstart);

% Importance sampling Monte Carlo 
% Results and time are stored in the 4th row of simu_results and time.
    tstart = tic;
    simu_results(4,j) = CIR_ipts(x0,a,k,sigma,T,N,M,u);
    time(4,j) = toc(tstart);
    
end

% Estimation of mean and variance of each methods
mean_results = mean(simu_results,2)
var_results = var(simu_results,0,2)
time_results = mean(time,2)+[0;0;0;addtiontime]
