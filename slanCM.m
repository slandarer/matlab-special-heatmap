function colorList=slanCM(type,num)
% @author : slandarer
% -------------------------------------------------------------------------
% type : type of colorbar
% num  : number of colors
% =========================================================================
% Zhaoxu Liu / slandarer (2023). 200 colormap 
% (https://www.mathworks.com/matlabcentral/fileexchange/120088-200-colormap), 
% MATLAB Central File Exchange. 检索来源 2023/3/15.
if nargin<2
    num=256;
end
if nargin<1
    type='';
end

slanCM_Data=load('slanCM_Data.mat');
CList_Data=[slanCM_Data.slandarerCM(:).Colors];
disp(slanCM_Data.author);

if isnumeric(type)
    Cmap=CList_Data{type};
else
    Cpos=strcmpi(type,slanCM_Data.fullNames);
    Cmap=CList_Data{Cpos};
end

Ci=1:256;Cq=linspace(1,256,num);
colorList=[interp1(Ci,Cmap(:,1),Cq,'linear')',...
           interp1(Ci,Cmap(:,2),Cq,'linear')',...
           interp1(Ci,Cmap(:,3),Cq,'linear')'];
% Zhaoxu Liu / slandarer (2023). 200 colormap 
% (https://www.mathworks.com/matlabcentral/fileexchange/120088-200-colormap), 
% MATLAB Central File Exchange. 检索来源 2023/3/15.
end