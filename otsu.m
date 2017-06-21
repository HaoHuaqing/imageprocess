function th=otsu(a);   
   a=rgb2gray(a);   
   %[count x]=imhist(a);   
   [m,n]=size(a);   
   N=m*n;   
   L=256;   
     
for i=1:L  
    count(i)=length(find(a==(i-1)));  
    f(i)=count(i)/(N);  
end  
  
for i=1:L   
    if count(i)~=0   
        st=i-1;   
        break;   
    end   
end   
for i=L:-1:1   
    if count(i)~=0   
        nd=i-1;   
        break;   
    end   
end   
%f=count(st+1:nd+1);  %f��ÿ���Ҷȳ��ֵĸ���   
p=st;   q=nd-st;   
u=0;   
for i=1:q   
    u=u+f(i)*(p+i-1);  %u�����ص�ƽ��ֵ    
    ua(i)=u;           %ua��i����ǰi�����ص�ƽ���Ҷ�ֵ   
end;   
   
for i=1:q   
    w(i)=sum(f(1:i));  %w��i����ǰi�����ص��ۼӸ���   
end;   
  
w=w+0.0001;  
   
d=(u*w-ua).^2./(w.*(1-w));   
[y,tp]=max(d);  %����ȡ����������ֵ��ȡ���ֵ�ĵ�   
th=tp+p;   
  
for i=1:m   
    for j=1:n   
        if a(i,j)>th   
            a(i,j)=255;   
        else   
            a(i,j)=0;   
        end   
    end   
end
imshow(a)