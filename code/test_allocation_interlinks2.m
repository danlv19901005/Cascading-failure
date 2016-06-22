%test if the algorithms of allocation interlinks improve the performance of two networks
% using allcoate_interlinks2.m assign the interlinks in the begining 
clear
clc


G1=ER_network(100,0.03);
%G2=ER_network(200,0.04);
G2=BA_network(200,2);

k1=4;
k2=2;
t_max=100;
G12=Generate_two_network(G1,G2,k1,k2);
G12_allocate=allocate_interlinks2(G1,G2,k1,k2);
beta1=0.3;
delta1=0.6;
beta2=0.3;
delta2=0.6;
threshold=[3,1];
a=10:40;
b=20:50;
[distribution1,distribution2,sum_fail1,sum_fail2]=SIS_t(G1,beta1,delta1,G2,beta2,delta2,G12,a,b,threshold,t_max);

plot(sum_fail1,'b:','LineWidth',2)
hold on
plot(sum_fail2,'k-.','LineWidth',2)

[distribution3,distribution4,sum_fail3,sum_fail4]=SIS_t(G1,beta1,delta1,G2,beta2,delta2,G12_allocate,a,b,threshold,t_max);

plot(sum_fail3,'g:','LineWidth',2)
plot(sum_fail4,'r-.','LineWidth',2)

[distribution5 sum_fail5]=SIS_s(G1,beta1,delta1,t_max,a)
[distribution6 sum_fail6]=SIS_s(G2,beta2,delta2,t_max,b)
plot(sum_fail5,'m:','LineWidth',2)
plot(sum_fail6,'c-.','LineWidth',2)

xlabel('Step','fontsize',16);
ylabel('Failure Number','fontsize',16);
legend('G1-Ranfom interlinks','G2-Ranfom interlinks','G1-Allocation','G2-Allocation','G1-Lower bound','G2-Lower bound')
%axis([1 1.1 0 n+5])
set(gca,'FontSize',16);
grid on
title('Comparison of Failure Number with Different Inter-links','fontsize',16);

