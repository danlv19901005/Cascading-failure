clear
clc
n=100;
p=0.05;
result=zeros(1,50);
for a=1:1:50
    alpha=1+a*0.02;
    for x=1:1:n-1
        for i=0:1:x/(alpha-1)
            for j=0:1:floor((i-x)/2)
                temp2=nchoosek(n-1,x)*p^x*(1-p)^(n-1-p);
                if(x<2)
                    temp=nchoosek((n-x-1)*x,i-x-2*j)*p^(i-x-2*j)*(1-p)^((n-x-1)*x-(i-x-2*j));
                    
                    result(a)=result(a)+temp*temp2;
                    continue;
                end
                
                temp1=nchoosek(x,2);
                if(j>temp1)
                    continue;
                end
                temp=nchoosek(temp1,j)*p^j*(1-p)^(temp1-j)*nchoosek((n-x-1)*x,i-x-2*j)*p^(i-x-2*j)*(1-p)^((n-x-1)*x-(i-x-2*j));
                 result(a)=result(a)+temp*temp2;
            end
        end
    end
end