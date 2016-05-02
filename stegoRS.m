%function [p]=steg(file)
%   calcula estimació Embedding Rate per mètode RS modificat 
%         Steganalysis of UnderMP3Cover
%       JIN, R.; WANG, R.; YAN, D.; YU, X.
% Journal of Computational Information Systems 8:24 (2012) 10459-10468
% http://www.jofcis.com/downloadpaper.aspx?id=2916&name=2012_8_24_10459_104
% 68.pdf

%file --- arxiu global_gain
%Autor: Carlos Alonso
%E-mail: calonsomar@uoc.edu
%Data: 14/04/2016
function [p]=stegoRS(file)

% Carreguem arxiu amb global_gain
gg = load(file);
gg=gg';
gg=gg(1:4590);


%X = sprintf('Granules: %d',size(gg,2));
%disp(X);

% Màscara
mask=[0 1 1 0];

% Punt 5 Calcular r i s amb Flip no negatiu
[r,s,u]=compare(gg,mask);
rplus=r/(r+s+u);
splus=s/(r+s+u);
%X = sprintf('rplus: %.4f',rplus);
%disp(X);
%X = sprintf('splus: %.4f',splus);
%disp(X);

% Punt 6 Calcular r i s amb Flip no positiu
[r,s,u]=ncompare(gg,mask);
rmin=r/(r+s+u);
smin=s/(r+s+u);
%X = sprintf('rmin: %.4f',rmin);
%disp(X);
%X = sprintf('smin: %.4f',smin);
%disp(X);


%Calcular LSB de gg
ggflipped=lsb(gg);

% Punt 7 Calcular r i s amb Flip no negatiu sobre LSB global_gain
[r,s,u]=compare(ggflipped,mask);
rplus2=r/(r+s+u);
splus2=s/(r+s+u);
%X = sprintf('rplus2: %.4f',rplus2);
%disp(X);
%X = sprintf('splus2: %.4f',splus2);
%disp(X);

% Punt 8 Calcular r i s amb Flip no positiu sobre LSB global_gain
[r,s,u]=ncompare(ggflipped,mask);
rmin2=r/(r+s+u);
smin2=s/(r+s+u);
%X = sprintf('rmin2: %.4f',rmin2);
%disp(X);
%X = sprintf('smin2: %.4f',smin2);
%disp(X);

%Estimar mida missatge
cr = (rmin-rplus)/(rmin-rplus+rmin2-rplus2);
cs = (splus-smin)/(splus-smin+splus2-smin2);
p= (cr+cs)/2;
if p<0
    p=0;
end
if p>1
    p=1;
end
%    disp('Cover');
%else
%X = sprintf('p: %.4f',p);
%disp(X);
