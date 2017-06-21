function imageOut=mrecon(image,method)
if not(exist('image','var'))
end

[row,col]=size(image);
imageOut=image;

if (strcmp(method,'Euclidean')) method=1; 
elseif (strcmp(method,'City Block')) method=2; 
elseif (strcmp(method,'Chessboard')) method=3; 
else 
   error('Valid method to RESTORATION is Euclidean,City Block and Chessboard');
end;

for i=1:row
    for j=1:col
        if(image(i,j)>1)
            d=image(i,j)-1;
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
                        if(distance>0&&distance<=d&&image(m,n)<=(d+1-distance))
                            imageOut(m,n)=max((d+1-distance),imageOut(m,n));
                        end
                    end
                end
            end           
        end       
    end
end