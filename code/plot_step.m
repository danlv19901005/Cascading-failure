%plot the number of failed in different step with changable alpha.
clear
clc
n=100;
p=0.05;
index=5000;
length=10;
 
%plot step2 to step 5
result=zeros(10,length);
result_5=zeros(10,length);
for i=1:1:length
    alpha=1.1+i*0.01
    for j=1:1:index
        G=ER_network(n,p);
        a_1=ceil(rand*100);
        a_5=1:1:5;
        f=load_based_cascade3(G,alpha,a_1,10);
        result(:,i)=result(:,i)+f';
        f=load_based_cascade3(G,alpha,a_5,10);
        result_5(:,i)=result_5(:,i)+f';
    end
end
result=result./index;
result_5=result_5./index;

result_single(1,:)=result(1,:)
for i=2:1:10
    result_single(i,:)=result_single(i-1,:)+result(i,:)
end
result_single=result_single./100;

result_52(1,:)=result_5(1,:)
for i=2:1:10
    result_52(i,:)=result_52(i-1,:)+result_5(i,:)
end
result_52=result_52./100;



plot(result_single(:,2),'b-^','LineWidth',2);
hold on
plot(result_52(:,4),'r-.*','LineWidth',2);
plot(result_single(:,8),'g--o','LineWidth',2);
plot(result_52(:,8),'k-.','LineWidth',2);


grid on

xlabel('Step','fontsize',16);
ylabel('Ratio of Failed','fontsize',16);
legend('\alpha=1.12','\alpha=1.14','\alpha=1.18')
%axis([1 1.1 0 n+5])
set(gca,'FontSize',16);

title('G_{100,0.05}','fontsize',16);

