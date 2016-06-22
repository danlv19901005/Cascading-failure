function [distribution1,distribution_temp1,sum_fail1,sum_fail2]=compute_distribution_t(G1,beta1,delta1,G2,beta2,delta2,G12,a,b,threshold,t_max)


n1=length(G1);
distribution1=zeros(1,n1);
distribution1(a)=1;
n2=length(G2);
distribution2=zeros(1,n2);
distribution2(b)=1;

distribution_temp1=distribution1;
for t=2:1:t_max
    %%%%%%%%% propagate in network 1
    distribution1(t,:)=0;
    for i=1:1:n1
        neighbor1=find(G1(i,:)==1);
        temp1=1-distribution1(t-1,neighbor1).*beta1;
        epi1=prod(temp1);
        %%%%distribution(t,i)=1-(1-distribution(t-1,i))*epi-delta*distribution(t-1,i)*epi;
        distribution1(t,i)=1-(1-distribution1(t-1,i))*epi1-delta1*distribution1(t-1,i);
    end
    %%%%%%%%% propagate in network 2
    distribution2(t,:)=0;
    for i=1:1:n2
        neighbor2=find(G2(i,:)==1);
        temp2=1-distribution2(t-1,neighbor).*beta2;
        epi2=prod(temp2);
        %%%%distribution(t,i)=1-(1-distribution(t-1,i))*epi-delta*distribution(t-1,i)*epi;
        distribution2(t,i)=1-(1-distribution2(t-1,i))*epi2-delta2*distribution2(t-1,i);
    end
    %%%%%%%%% update distribution in network 1 and 2
    if(threshold(1)>0)
        % compute the probability of network1 fail because of network 2
      
        temp=G12*distribution2(t,:);
        temp_p=temp./degree1;%the average failure probability of each neigbors
        temp_q=1-temp_p;
        temp=0
        for i=0:1:threshold(1)-1
            temp=temp+temp_q^i*temp_p^(n-1)*nchoosek(degree1,i);
        end
    end
    
    if(threshold(2)>0)
        temp=G12*distribution1(t,:);
        temp_p=temp./degree2;%the average failure probability of each neigbors
        temp_q=1-temp_p;
        temp=0
        for i=0:1:threshold(2)-1
            temp=temp+temp_q^i*temp_p^(n-1)*nchoosek(degree1,i);
        end
        
    end
    
    
end
sum_fail=sum(distribution1,2);