function [distribution1,distribution2,sum_fail1,sum_fail2]=SIS_t(G1,beta1,delta1,G2,beta2,delta2,G12,a,b,threshold,t_max)
%%% the function can run sis model on two connected network %%%
% threshold is [t1,t2] indicates the threshold of each network

index=5000;
n1=length(G1);
n2=length(G2);
distribution1=0;
distribution2=0;
sum_fail1=0;
sum_fail2=0;
for i=1:1:index
    failure_index1=zeros(1,n1);
    failure_index2=zeros(1,n2);
    failure_index1(a)=1;
    failure_index2(b)=1;
    pre_fail1=a;
    pre_fail2=b;
    sum_failure1=length(a);
    sum_failure2=length(b);
    for t=2:1:t_max+1
        %one step propagation in network 1
        failure_index1(t,:)=failure_index1(t-1,:);
        target=find(failure_index1(t,:)*G1>0);%the targeted nodes
        temp=find(failure_index1(t,target)==1);
        target(temp)=[];
        if target
            target(2,:)=failure_index1(t,:)*G1(:,target);%their fail neighbor number
            temp1=rand(1,length(target(1,:)));
            criter1=1-(1-beta1).^target(2,:);
            temp2=rand(1,length(pre_fail1));
            cured=find(temp2<delta1);
            infected=find(temp1<criter1);
            failure_index1(t,pre_fail1(cured))=failure_index1(t-1,pre_fail1(cured))-1;
            failure_index1(t,target(1,infected))=failure_index1(t,target(1,infected))+1;
            pre_fail1=find(failure_index1(t,:)==1);
         %   sum_failure1(t)=length(pre_fail1);
        else
            temp2=rand(1,length(pre_fail1));
            cured=find(temp2<delta1);
            failure_index1(t,pre_fail1(cured))=failure_index1(t-1,pre_fail1(cured))-1;
            pre_fail1=find(failure_index1(t,:)==1);
         %   sum_failure1(t)=length(pre_fail1);
        end
        %%% one step propagation in network 2
        failure_index2(t,:)=failure_index2(t-1,:);
        target=find(failure_index2(t,:)*G2>0);%the targeted nodes
        temp=find(failure_index2(t,target)==1);
        target(temp)=[];
        if target
            target(2,:)=failure_index2(t,:)*G2(:,target);%their fail neighbor number
            temp1=rand(1,length(target(1,:)));
            criter1=1-(1-beta2).^target(2,:);
            temp2=rand(1,length(pre_fail2));
            cured=find(temp2<delta2);
            infected=find(temp1<criter1);
            failure_index2(t,pre_fail2(cured))=failure_index2(t-1,pre_fail2(cured))-1;
            failure_index2(t,target(1,infected))=failure_index2(t,target(1,infected))+1;
            pre_fail2=find(failure_index2(t,:)==1);
        %    sum_failure2(t)=length(pre_fail2);
        else
            temp2=rand(1,length(pre_fail2));
            cured=find(temp2<delta2);
            failure_index2(t,pre_fail2(cured))=failure_index2(t-1,pre_fail2(cured))-1;
            pre_fail2=find(failure_index2(t,:)==1);
       %     sum_failure2(t)=length(pre_fail2);
        end
        %%% count the new failed node due to inter-links 
        newfail1=find(G12*(1-failure_index2(t,:))'<threshold(1));
        newfail2=find((1-failure_index1(t,:))*G12<threshold(2));
        temp1=find(failure_index1(t,newfail1)==1);
        temp2=find(failure_index2(t,newfail2)==1);
        newfail1(temp1)=[];
        newfail2(temp2)=[];
        pre_fail1=[pre_fail1 newfail1'];
        pre_fail2=[pre_fail2 newfail2];
        failure_index1(t,newfail1)=failure_index1(t,newfail1)+1;
        failure_index2(t,newfail2)=failure_index2(t,newfail2)+1;
        %max(max(failure_index1))
        %min(min(failure_index1))
        %max(max(failure_index2))
        %min(min(failure_index2))
    end
    distribution1=distribution1+failure_index1;
    distribution2=distribution2+failure_index2;
 %   sum_fail1=sum_fail1+sum_failure1;
  %  sum_fail2=sum_fail2+sum_failure2;
end
distribution1=distribution1./index;
distribution2=distribution2./index;
sum_fail1=sum(distribution1,2);
sum_fail2=sum(distribution2,2);