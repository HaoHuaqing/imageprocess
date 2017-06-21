function imageOut=mdt(image,method)
if not(exist('image','var'))
end
if(size(image,3)==3)
    image=rgb2gray(image);
end
image=im2bw(image);
[row,col]=size(image);
imageOut=zeros(row,col);

if (strcmp(method,'Euclidean')) method=1; 
elseif (strcmp(method,'City Block')) method=2; 
elseif (strcmp(method,'Chessboard')) method=3; 
else 
   error('Valid method to Distance Transform is Euclidean,City Block and Chessboard');
end;

for i=1:row
    for j=1:col
        test=1;
        if(image(i,j))
          d=1;
          while(test>0)
            if((i-d)>0&&(j-d)>0&&(i+d)<=row&&(j+d)<=col)
                for m=i-d:i+d
                    for n=j-d:j+d
                        if(method==1)
                        distance=sqrt((m-i).^2+(n-j).^2);
                        end
                        if(method==2)
                        distance=abs(m-i)+abs(n-j);
                        end
                        if(method==3)
                        distance=max(abs(m-i),abs(n-j));
                        end
                        if(distance<=d&&image(m,n)<1)
                            test=0;
                            break;
                        end                  
                    end
                    if(test==0)
                        break;
                    end
                end  
                if(test==1)
                    d=d+1;
                end
            else
                test=0;
            end              
            imageOut(i,j)=d;
          end
        end
    end
end
