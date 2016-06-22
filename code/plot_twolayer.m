clear
clc
n1=150;
n2=150;
G1=ER_network(n1,0.02);
G2=BA_network(n2,2);
G12=Generate_two_network(G1,G2,2,2);
beta1=0.3
delta1=0.6
beta2=0.3
delta2=0.6
threshold=[0,0]
max_time=30
a=[1,2,3,4,5,6,7,8]
b=[1,2]



[distribution1 sum_fail1]=SIS_s(G1,beta1,delta1,max_time,a);

[distribution2 sum_fail2]=SIS_s(G2,beta2,delta2,max_time,b);

[distribution3,distribution4,sum_fail3,sum_fail4]=SIS_t(G1,beta1,delta1,G2,beta2,delta2,G12,a,b,threshold)

sum_fail1=sum_fail1/n1;
sum_fail2=sum_fail2/n2;
sum_fail3=sum_fail3/n1;
sum_fail4=sum_fail4/n2;

plot(sum_fail1,'b-.','LineWidth',2)
hold on
plot(sum_fail2,'g-.','LineWidth',2)
plot(sum_fail3,'p-.','LineWidth',2)
plot(sum_fail4,'r','LineWidth',2)
grid on

xlabel('Step','fontsize',16);
ylabel('failure ratio','fontsize',16);
legend('G1 alone','G2 alone','G1','G2')
%axis([1 1.1 0 n+5])
set(gca,'FontSize',16);

title('G_{100,0.05}','fontsize',16);

