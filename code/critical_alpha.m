function [alpha_c,alpha_h2,alpha_h3,alpha_l2,alpha_l3]=critical_alpha(n,p)
alpha_c=1./(1-(n-1)*p^2./2+(n-1.5)*p)+1;
c=2;
alpha_h2=1./(-c*sqrt((p+1-2/(n-1))*(1-p))+1+(n-0.5*(n-1)*p-1.5)*p)+1        
alpha_l2=1./(c*sqrt((p+1-2/(n-1))*(1-p))+1+(n-0.5*(n-1)*p-1.5)*p)+1        
c=3;
alpha_h3=1./(-c*sqrt((p+1-2/(n-1))*(1-p))+1+(n-0.5*(n-1)*p-1.5)*p)+1        
alpha_l3=1./(c*sqrt((p+1-2/(n-1))*(1-p))+1+(n-0.5*(n-1)*p-1.5)*p)+1        

  
