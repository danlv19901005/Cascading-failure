function result=compute_v_i_size(n,p,v_0,max_step)


result(1)=1-(1-p)^v_0;
for i=2:1:max_step
    q=1-p+p*(1-sum(result(1:i-1)));
    result(i)=(1-result(1))*(1-q^(n-2))+result(1)-sum(result(1:i-1));
    %temp(i-1)=1-q^(n-2)
end
result=(n-v_0).*result;
result=[v_0,result];