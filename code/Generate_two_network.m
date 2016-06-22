%Generate a two-layered network
function G12=Generate_two_network(G1,G2,k1,k2)
%network 1: ER random graph (n1,p1)
%network 2: ER random graph (n2,p2)
%network 1 and network 2 are regulated graphs with degree k1 and k2
%note n1*k1=n2*k2
%% generate links between two networks

n1=length(G1);
n2=length(G2);
G12=zeros(n1,n2);
rest_degree_G1=ones(1,n1)*k1;
rest_degree_G2=ones(1,n2)*k2;
while find(rest_degree_G1>0)
    index_G1=find(rest_degree_G1>0);
    rand1=ceil(rand*length(index_G1));
    index_G2=find(G12(index_G1(rand1),:)==0 & rest_degree_G2>0);
    rand2=ceil(rand*length(index_G2));
    index_G1
    if(length(index_G2)==0)
        index_G2
    end
    rand2
    G12(index_G1(rand1),index_G2(rand2))=G12(index_G1(rand1),index_G2(rand2))+1;
    rest_degree_G1(index_G1(rand1))=rest_degree_G1(index_G1(rand1))-1;
    rest_degree_G2(index_G2(rand2))=rest_degree_G2(index_G2(rand2))-1;
end
