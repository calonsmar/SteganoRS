%function [r,s,u]=compare(gg,mask)
%function ---calcula R S U amb Funció no negativa
%gg --- vector entrada
%mask ---màscara
%Autor: Carlos Alonso
%E-mail: calonsomar@uoc.edu
%Data: 14/04/2016

function [r,s,u]=compare(gg,mask)
    
    
    col=size(gg,2);
    c=size(mask,2);
    r=0;
    s=0;
    u=0;
    for i=1:col-(c-1)
        grup=gg(i:i+(c-1));
        %Variation original vector
        original = discrimination(grup);
        %Apply F1 operation
        flipat = ftrans(grup,mask);
        flipvariation = discrimination(flipat);
        
        if (flipvariation > original)
            r=r+1;
        else
            if (flipvariation < original)
                s=s+1;
            else
                u=u+1;
            end
        end
    end
        
        
        
     

        