function G=BA_network(N,n0)
%generate a scale free network size of N begin with n0 connected nodes

G=1-eye(2);


for i=n0+1:1:N
    n=length(G);
    degree=sum(G);
    temp=rand(1,n);
    criterion=degree./sum(degree);
    new_connect=find(temp<criterion);
    G(i,new_connect)=1;
    G(new_connect,i)=1;
end


    
    