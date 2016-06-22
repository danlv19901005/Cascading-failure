% the function to compute the failure distribution of SIS on single network 
function [distribution sum_fail]=compute_distribution(G,beta,delta,t_max,a)
n=length(G);
distribution=zeros(1,n);
distribution(a)=1;
distribution2=distribution;
for t=2:1:t_max
    distribution(t,:)=0;
    distribution2(t,:)=0;
    for i=1:1:n
        neighbor=find(G(i,:)==1);
        temp=1-distribution(t-1,neighbor).*beta;
        epi=prod(temp);
        %%%%distribution(t,i)=1-(1-distribution(t-1,i))*epi-delta*distribution(t-1,i)*epi;
        distribution(t,i)=1-(1-distribution(t-1,i))*epi-delta*distribution(t-1,i);
        temp2=1-distribution2(t-1,neighbor)+distribution2(t-1,neighbor).*(1-beta);
        epi2=prod(temp);
        distribution2(t,i)=distribution2(t-1,i)*(1-delta)+(1-distribution2(t-1,i))*(1-epi);
    end
end
sum_fail=sum(distribution,2);