%Generate a ER_network 
function G=ER_network(N,P)
connect_probability=rand(N,N);
for i=1:1:N
    for j=i:1:N
        connect_probability(i,i)=1;
        connect_probability(i,j)=connect_probability(j,i);
    end
end
G=(connect_probability<P);