%%  allcoate the interlinks just one time in the beginning
%% allocate based on the log transformation of its degree and second order degree
function G12=allocate_interlinks2(G1,G2,k1,k2)
n1=length(G1);
n2=length(G2);
G12=zeros(n1,n2);
rest_degree_G1=ones(1,n1)*k1;
rest_degree_G2=ones(1,n2)*k2;

d1=sum(G1);
d2=sum(G2);
d12=d1*G1;
d22=d2*G2;

log_transform1=log(d1)+log(d12);
log_transform2=log(d2)+log(d22);

while(find(rest_degree_G1>0))
   index1=find(log_transform1==min(log_transform1)&rest_degree_G1>0,1)
   temp=find(G12(index1,:)==0&rest_degree_G2>0);
   index2=find(log_transform2(temp)==min(log_transform2(temp)),1)
   G12(index1,temp(index2))=G12(index1,temp(index2))+1;
   rest_degree_G1(index1)=rest_degree_G1(index1)-1;
   if(rest_degree_G1(index1)==0)
       log_transform1(index1)=inf;
   end
   rest_degree_G2(temp(index2))=rest_degree_G2(temp(index2))-1;
   if(rest_degree_G2(temp(index2))==0)
       log_transform2(temp(index2))=inf;
   end   
end
sum(G12)
sum(G12,2)