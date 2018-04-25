function [ Newpeople ] = Newgeneration( People,Adaptvalue,echgrate,mutrate,popsize,m )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

Chosenprob = (Adaptvalue-sum(Adaptvalue))/(1-popsize)/sum(Adaptvalue);
chosen = randsrc(1,popsize,[1:popsize;Chosenprob']);
Newpeople = People(chosen,:);

for i=1:popsize/2
    if rand()<echgrate
        exm = sort(randi([1,m],1,2));
        temp = Newpeople(2*i-1,exm(1):exm(2));
        Newpeople(2*i-1,exm(1):exm(2)) = Newpeople(2*i,exm(1):exm(2));
        Newpeople(2*i,exm(1):exm(2)) = temp;
    end
    if rand()<mutrate
        mutm = randi([1,m]);
        Newpeople(2*i-1,mutm) = abs(Newpeople(2*i-1,mutm)-1);
    end
    if rand()<mutrate
        mutm = randi([1,m]);
        Newpeople(2*i,mutm) = abs(Newpeople(2*i,mutm)-1);
    end
end
end



