clear
clc
x=5;
n=100;
p=0.08;


eta=x+nchoosek(x,2)*p+(n-x-1)*x*p;
sigma2=(4*nchoosek(x,2)+(n-x-1)*x)*p*(1-p);
pp=zeros(1,100)
for i=1:1:100
    x=1;
    alpha=1+0.01*i;
    eta=x+(n-2)*p;
    sigma2=(n-2)*p*(1-p);
    pp(i)=nchoosek(n-1,x)*p^x*(1-p)^(n-1-x)*normcdf((x/(alpha-1)-eta)./sqrt(sigma2));
    for x=2:1:n-1
        eta=x+nchoosek(x,2)*p+(n-x-1)*x*p;
        sigma2=(4*nchoosek(x,2)+(n-x-1)*x)*p*(1-p);
        pp(i)=pp(i)+nchoosek(n-1,x)*p^x*(1-p)^(n-1-x)*normcdf((x/(alpha-1)-eta)./sqrt(sigma2));
    end
end
alpha=1.01:0.01:2
plot(alpha,pp)
grid on
hold on


x=1:1:80
c=2;
%alpha=1./(1-n*p^2./2+(n-1.5)*p)+1
alpha_h1=1./(-2.*sqrt((1+n./x-3./x).*p.*(1-p))+1+0.5.*x.*p+(n-x-1.5).*p)+1
alpha_l1=1./(2.*sqrt((1+n./x-3./x).*p.*(1-p))+1+0.5.*x.*p+(n-x-1.5).*p)+1
%alpha_h2=1./(-c*sqrt((p+1-2/(n-1))*(1-p))+1+(n-0.5*(n-1)*p-1.5)*p)+1
%alpha_h2=1./(-c*sqrt((p+1-2/(n-1))*(1-p))+1+(n-0.5*(n-1)*p-1.5)*p)+1
%eta=x+nchoosek(x,2)*p+(n-x-1)*x*p;
%sigma2=(4*nchoosek(x,2)+(n-x-1)*x)*p*(1-p);
%(x/(alpha_h-1)-eta)./sqrt(sigma2)
%alpha_l=1./(2.*sqrt((1+n./x-3./x).*p.*(1-p))+1+0.5.*x.*p+(n-x-1.5).*p)+1
%alpha_l2=1./(c*sqrt((p+1-2/(n-1))*(1-p))+1+(n-0.5*(n-1)*p-1.5)*p)+1
[alpha_c,alpha_h2,alpha_h3,alpha_l2,alpha_l3]=critical_alpha(n,p)

scatter(alpha_c,1,'r')

scatter([alpha_l2,alpha_h2],[1,1],'.b')

scatter([alpha_l3,alpha_h3],[1,1],'.g')

scatter([alpha_l2,alpha_h2],[0,0],'.b')

scatter([alpha_l3,alpha_h3],[0,0],'.g')

figure(2)
plot(alpha_h1)

c=2;
A=(-c.*sqrt((1+n./x-3./x).*p.*(1-p))+1+0.5.*x.*p+(n-x-1.5).*p)
A_n1=1./(-c.*sqrt((1+n./x-3./x).*p.*(1-p))+1+0.5.*x.*p+(n-x-1.5).*p)
C=-1.*(c.*sqrt((1+(n-3)./x).*p.*(1-p))+(1+0.5.*x.*p+n.*p-x.*p-1.5.*p)).^(-2)
D=-c.*0.5.*((1+(n-3)./x).*p.*(1-p)).^(-0.5).*(1-p).*p.*(-1).*x.^(-2)-0.5*p