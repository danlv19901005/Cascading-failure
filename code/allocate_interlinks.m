%%  allcoate the interlinks, update on each step
%% based on the state of nodes
function G12=allocate_interlinks(failure_index1,failure_index2,k1,k2)
n1=length(failure_index1);
n2=length(failure_index2);
G12=zeros(n1,n2);
rest_degree_G1=failure_index1*k1;
rest_degree_G2=failure_index2*k2;

while min(length(find(rest_degree_G1>0)),length(find(rest_degree_G2>0)))
    index_G1=find(rest_degree_G1>0);
    rand1=ceil(rand*length(index_G1));
    index_G2=find(G12(index_G1(rand1),:)==0 & rest_degree_G2>0);
     if(length(index_G2)==0)
        break;
    end
   
    rand2=ceil(rand*length(index_G2));
    %index_G1
    if(length(index_G2)==0)
        index_G2
    end
    %rand2
    G12(index_G1(rand1),index_G2(rand2))=G12(index_G1(rand1),index_G2(rand2))+1;
    rest_degree_G1(index_G1(rand1))=rest_degree_G1(index_G1(rand1))-1;
    rest_degree_G2(index_G2(rand2))=rest_degree_G2(index_G2(rand2))-1;
end

rest_degree_G1=k1-sum(G12,2);
rest_degree_G2=k2-sum(G12);

while find(rest_degree_G2>0)
    index_G1=find(rest_degree_G1>0);
    rand1=ceil(rand*length(index_G1));
    index_G2=find(G12(index_G1(rand1),:)==0 & rest_degree_G2>0);
    if(length(index_G2)==0)
        break;
    end
    rand2=ceil(rand*length(index_G2));
    %index_G1
    if(length(index_G2)==0)
        index_G2
    end
    %rand2
    G12(index_G1(rand1),index_G2(rand2))=G12(index_G1(rand1),index_G2(rand2))+1;
    rest_degree_G1(index_G1(rand1))=rest_degree_G1(index_G1(rand1))-1;
    rest_degree_G2(index_G2(rand2))=rest_degree_G2(index_G2(rand2))-1;
end



