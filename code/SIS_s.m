% 8/27/2015 SIS model on a single network
% a function to get the failure distribution of SIS model on single layer
% network
function [distribution sum_fail]=SIS_s(G,beta,delta,t_max,a)
% beta is infect probability ,delta is the cured probability
% a is initial attack node/nodes
% this function can get the average distribution of failure probability of
% ever node for all step before t_max+1

index=5000;
n=length(G);
distribution=0;
sum_fail=0;
for i=1:1:index
    failure_index=zeros(1,n);
    failure_index(a)=1;
    pre_fail=a;
    sum_failure=length(a);
    for t=2:1:t_max+1
        failure_index(t,:)=failure_index(t-1,:);
        target=find(failure_index(t,:)*G>0);%the targeted nodes
        temp=find(failure_index(t,target)==1);
        target(temp)=[];%remove the failed nodes from the targeted nodes
        if target %if target is not empty
            target(2,:)=failure_index(t,:)*G(:,target);%their fail neighbor number
            temp1=rand(1,length(target(1,:)));% the prob to infect
            threshold1=1-(1-beta).^target(2,:);
            temp2=rand(1,length(pre_fail));% the prob to cure
            cured=find(temp2<delta);
            infected=find(temp1<threshold1);
            failure_index(t,pre_fail(cured))=failure_index(t-1,pre_fail(cured))-1;
            failure_index(t,target(1,infected))=failure_index(t,target(1,infected))+1;
            pre_fail=find(failure_index(t,:)==1);
            sum_failure(t)=length(pre_fail);
        else
            temp2=rand(1,length(pre_fail));
            cured=find(temp2<delta);
            failure_index(t,pre_fail(cured))=failure_index(t-1,pre_fail(cured))-1;
            pre_fail=find(failure_index(t,:)==1);
            sum_failure(t)=length(pre_fail);
            
        end
    end
    distribution=distribution+failure_index;
    sum_fail=sum_fail+sum_failure;
end
distribution=distribution./index;
sum_fail=sum_fail./index;




