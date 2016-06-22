clear
clc

G1=ER_network(100,0.05);
G2=BA_network(150,2);
G12=Generate_two_network(G1,G2,3,2);
beta1=0.3
delta1=0.6
beta2=0.4
delta2=0.5
threshold=[1,1]
max_time=30
a=[1];
a2=1:1:30;
b=[1,1]

vi_index=get_vi(G1,a,10)
max(vi_index)
[distribution1 sum_fail1]=SIS_s(G1,beta1,delta1,max_time,a);
%[distribution2 sum_fail2]=SIS_s(G1,beta1,delta1,max_time,a2);
%[distribution1 sum_fail11]=compute_distribution(G1,beta1,delta1,max_time,a);
[distribution2 sum_fail2]=SIS_s(G2,beta2,delta2,max_time,b);
%[distribution22 sum_fail22]=compute_distribution(G2,beta2,delta2,max_time,b);
[distribution3,distribution4,sum_fail3,sum_fail4]=SIS_t(G1,beta1,delta1,G2,beta2,delta2,G12,a,b,threshold)

plot(sum_fail1,'b-.','LineWidth',2)
hold on

plot(sum_fail2,'g-.','LineWidth',2)
plot(sum_fail3,'p-.','LineWidth',2)
plot(sum_fail4,'r','LineWidth',2)
grid on

xlabel('Step','fontsize',16);
ylabel('sum_failure','fontsize',16);
legend('G1 alone','G2 alone','G1','G2')
%axis([1 1.1 0 n+5])
set(gca,'FontSize',16);

title('G_{100,0.05}','fontsize',16);

