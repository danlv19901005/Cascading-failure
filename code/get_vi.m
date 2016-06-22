function vi_index=get_vi(G,a,maxi)
n=length(G);
vi_index=zeros(1,n)-1;
vi_index(a)=0;

for j=1:1:maxi
    for i=1:1:length(a)
        temp=find(G(a(i),:)==1 & vi_index==-1);
        vi_index(temp)=j;        
    end
    a=find(vi_index==j);
end

