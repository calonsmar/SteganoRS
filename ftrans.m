
%function [transgrup]=ftrans(grup,mask)
%Transformació no negativa
%grup ---input vector
%mask ---mask
%Autor: Carlos Alonso
%E-mail: calonsomar@uoc.edu
%Data: 14/04/2016

% Transformació no negativa

function [transgrup]=ftrans(grup,mask)
c=size(mask,2);
transgrup = zeros(1,c);
for p=1:c
    if mask(p)==1
        % Aplica F1
        % Si el bit LSB és 0 suma 1 
        % Si el bit LSB és 1 resta 1
        if mod(grup(p),2)==0
            transgrup(p)=grup(p)+1;
            
        else
            transgrup(p)=grup(p)-1;
        end
    else
        % Aplica F0 (ho deixem igual)
        transgrup(p)=grup(p);
    end
    if transgrup(p)==-1
        transgrup(p)=255;
    end
    if tansgrup(p)==256
        transgrup(p)=0;
    end
end



