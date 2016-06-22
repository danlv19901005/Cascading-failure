clear
clc


G1=ER_network(100,0.03);
%G2=ER_network(200,0.04);
G2=BA_network(200,2);

k1=4;
k2=2;
t_max=100;
G12=Generate_two_network(G1,G2,k1,k2);
beta1=0.3;
delta1=0.6;
beta2=0.3;
delta2=0.6;
threshold=[3,3];
a=10:40;
b=20:50;
[distribution1,distribution2,sum_fail1,sum_fail2]=SIS_t(G1,beta1,delta1,G2,beta2,delta2,G12,a,b,threshold,t_max);
plot(sum_fail1,'b:','LineWidth',2)
hold on
plot(sum_fail2,'k-.','LineWidth',2)

%a=1:2;
a=[];
%b=[];
b=3:4;
[distribution1,distribution2,sum_fail1,sum_fail2]=SIS_t(G1,beta1,delta1,G2,beta2,delta2,G12,a,b,threshold,t_max);
plot(sum_fail1,'m-- ','LineWidth',2)
plot(sum_fail2,'r','LineWidth',2)

grid on

xlabel('Step','fontsize',16);
ylabel('failure number','fontsize',16);
legend('G1 with a=[10:40] and b=[20:50]','G2 with a=[10:40] and b=[20:50]','G1 with a=[1,2]','G2 with a=[1,2]')
%axis([1 1.1 0 n+5])
set(gca,'FontSize',16);

title('Comparison of Different Sets','fontsize',16);


