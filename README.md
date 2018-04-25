# Shawn
This code is based on Alfonsi’s Framework about implicit Euler scheme of CIR process. 

I use Monte Carlo Methods to compute zero-coupon bond with CIR process. Then I apply antithetic variates, latin hypercube sampling (one derivation on multi-dimension case of stratified sampling) and importance sampling to the simulation. I caculate mean, variance and time cost for these four methods (including plain Monte Carlo) and compare the results.

For importance sampling, I use genetic algorithm to solve optimal drift problem. It's neither efficient nor accurate but it's easy enough to implement. Anyone who have any better idea to solve the problem, PLEASE TELL ME.
