%plot the number of failed in different step with changable alpha.
clear
clc
n=100;
p=0.05;
index=80;
length1=25
 
%plot step2 to step 6
result=zeros(10,length1);
for i=1:1:length1
    alpha=1.001+(i-1)*0.03
    for j=1:1:index
        G=ER_network(n,p);
        for k=1:1:50
        a=ceil(rand*100);
        f=load_based_cascade3(G,alpha,a,10);
        result(:,i)=result(:,i)+f';
        end
    end
end
result=result./index;
result2(1,:)=result(1,:)
for i=2:1:10
    result2(i,:)=result2(i-1,:)+result(i,:)
end


result2=result2./n/50;

alpha=1.001:0.03:1.001+0.03*(length1-1);
plot(alpha,result2(2,:),'b-h','LineWidth',2);
hold on
plot(alpha,result2(3,:),'g-v','LineWidth',2);
plot(alpha,result2(4,:),'r-.','LineWidth',2);
plot(alpha,result2(5,:),'m--o','LineWidth',2);
plot(alpha,result2(10,:),'k-','LineWidth',2);


[alpha_c,alpha_h2,alpha_h3,alpha_l2,alpha_l3]=critical_alpha(n,p);
y=1:2:n+5;
hold on
scatter(alpha_c*ones(1,length(y)),y./n,'r')

scatter([alpha_l2*ones(1,length(y)),alpha_h2*ones(1,length(y))],[y,y]./n,'*b')

scatter([alpha_l3*ones(1,length(y)),alpha_h3*ones(1,length(y))],[y,y]./n,'.g')
%grid on
xlabel('\alpha','fontsize',16);
ylabel('Failure Ratio','fontsize',16);
legend('E[f_2]','E[f_3]','E[f_4]','E[f_5]','E[f_{steady state}]','\alpha_c','2-\sigma zone','3-\sigma zone')
axis([1 1.35 0 1])
set(gca,'FontSize',16);

title('Cascading Failure on G(200,0.03)','fontsize',16);