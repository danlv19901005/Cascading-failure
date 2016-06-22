% this is not a function
% test the computation on single network vs the simulation
% test if the steady state does not depend on the initial failure
clear
clc
% test if the steady state does not depend on the initial failure
%{
figure(1);
G=ER_network(100,0.07);
beta=0.3;
delta=0.6;
t_max=100;
a=[1,2];
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));
hold on;
a=10:1:20;
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));

a=20:1:40;
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));

xlabel('Node','fontsize',16);
ylabel('Failure Distribution','fontsize',16);
legend('a=[1,2]','a=[10:20]','a=[20:40]');
set(gca,'FontSize',16);
title('SIS model in single network G(100,0.07)','fontsize',16);

figure(2)
G=BA_network(150,2);
a=[1,2];
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));
hold on;
a=10:1:20;
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));

a=20:1:40;
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));

xlabel('Node','fontsize',16);
ylabel('Failure Distribution','fontsize',16);
legend('a=[1,2]','a=[10:20]','a=[20:40]');
set(gca,'FontSize',16);
title('SIS model in single network BA(100)','fontsize',16);
%}

% test if the computing matches the the simulation probability distribution
%{
figure(3);
G=ER_network(100,0.07);
beta=0.3;
delta=0.6;
t_max=100;
a=[1,2];
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));
hold on;
[distribution2 sum_fail2]=compute_distribution(G,beta,delta,t_max,a)
plot(distribution2(end,:));
xlabel('Node','fontsize',16);
ylabel('Failure Distribution','fontsize',16);
legend('Simulation','Theoretic Analysis');
set(gca,'FontSize',16);
title('SIS model in G(100,0.07),a=[1,2],steady state ','fontsize',16);

figure(4);
G=BA_network(150,2);
a=10:1:20;
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
plot(distribution(end,:));
hold on;
[distribution2 sum_fail2]=compute_distribution(G,beta,delta,t_max,a)
plot(distribution2(end,:));
xlabel('Node','fontsize',16);
ylabel('Failure Distribution','fontsize',16);
legend('Simulation','Theoretic Analysis');
set(gca,'FontSize',16);
title('SIS model in BA(150),a=[10:20],steady state ','fontsize',16);
%}

%test the failure number over time

figure(5);
G=ER_network(100,0.07);
beta=0.3;
delta=0.6;
t_max=100;
a=[1,2];
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
[distribution2 sum_fail2]=compute_distribution(G,beta,delta,t_max,a);
plot(sum_fail(1:30),'r-');
hold on
plot(sum_fail2(1:30),'b-.');
xlabel('Step','fontsize',16);
ylabel('Failure Number','fontsize',16);
legend('Simulation','Theoretic Analysis');
set(gca,'FontSize',16);
title('SIS model in ER(100,0.07),a=[1,2]','fontsize',16);

figure(6);
G=BA_network(150,2);
beta=0.3;
delta=0.6;
t_max=100;
a=[20:30];
[distribution sum_fail]=SIS_s(G,beta,delta,t_max,a);
[distribution2 sum_fail2]=compute_distribution(G,beta,delta,t_max,a);
plot(sum_fail(1:30),'r-');
hold on
plot(sum_fail2(1:30),'b-.');
xlabel('Step','fontsize',16);
ylabel('Failure Number','fontsize',16);
legend('Simulation','Theoretic Analysis');
set(gca,'FontSize',16);
title('SIS model in BA(150),a=[10:20]','fontsize',16);



