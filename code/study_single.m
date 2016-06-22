% ranking log(d1)+log(d2);
clear
clc
n=500;
%G=BA_network(n,2);
G=ER_network(n,0.02);
beta=0.3;
delta=0.6;
max_time=50;
a=[1,2,3];
[distribution1 sum_fail1]=SIS_s(G,beta,delta,max_time,a);

degree1=sum(G);
degree2=zeros(1,n);
for i=1:1:n
    temp_neigh=find(G(i,:)==1);
   if temp_neigh
       for j=1:1:length(temp_neigh)
           degree2(i)=degree2(i)+degree1(temp_neigh(j));
       end
   end
end
    
distribution=distribution1(end,:)'
degree1=degree1'
degree2=degree2'
data=distribution%*100;
data(:,2)=log(degree1);
data(:,3)=log(degree2);
temp=find(data(:,1)==0);
data(temp,:)=[];
data(:,4)=data(:,2)+data(:,3);
data(:,5)=1;
b=data(:,4:5)\data(:,1);
figure(1);
scatter(data(:,4),data(:,1));
hold on;
xx=[0:9]
plot(xx,b(1)*xx+b(2),'LineWidth',2);
grid on;
xlabel('log(d1)+log(d2)','fontsize',16);
ylabel('failure probability','fontsize',16);
legend('real probability','regression')
set(gca,'FontSize',16);

title('Regression of failure probability on BA(500)','fontsize',16);