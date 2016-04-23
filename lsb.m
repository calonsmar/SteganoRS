%function [qq]=lsb(gg)
%function ---aplica LSB a tot el vector
%gg --- vector entrada
%qq --- vector sortida transformat
%Autor: Carlos Alonso
%E-mail: calonsomar@uoc.edu
%Data: 14/04/2016

function [qq]=lsb(gg)
    
    
    col=size(gg,2);
    qq = zeros(1,col);
    for i=1:col
        if (mod(gg(i),2)==0)
            qq(i)=gg(i)+1;
        else
            qq(i)=gg(i)-1;
        end
    end
    
     
        
        
     

        