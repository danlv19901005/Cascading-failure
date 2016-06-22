%function [f,failure]=load_based_cascade3(G,alpha,a,t_max)
function f=load_based_cascade3(G,alpha,a,t_max)
%a is the initial attacked vertex
n=length(G);
L=sum(G);
C=alpha*L;
alive=ones(1,n);
current=a;
current_index=zeros(1,n);
current_index(current)=1;
f=[length(a),0];
t=2;
for t=2:1:t_max
    %check if there is any inside failed nodes
    temp1=sum(G(current,:),2);
    temp2=G(current,:)*current_index';
    inside=current(find(temp1==temp2&temp1>0));
    %redistribute the load inside to outside nodes
    if length(inside)
        for i=1:1:length(inside)
            L(find(G(inside(i),:)==1))=L(find(G(inside(i),:)==1))+L(inside(i))/sum(G(inside(i),:));
        end
        G(inside,:)=0;
        G(:,inside)=0;
        L(inside)=0;
        current(find(temp1==temp2&temp1>0))=[];
    end
    for i=1:1:length(current)
        neighbor=find(G(current(i),:)==1);
        temp=C(neighbor)./sum(C(neighbor));
        L(neighbor)=L(neighbor)+L(current(i)).*temp;
        G(current(i),:)=0;
        G(:,current(i))=0;
        L(current(i))=0;
    end
    current=find(L>C);
    f(t)=length(current);
end
%failure=(sum(f)>0.8*n);

        