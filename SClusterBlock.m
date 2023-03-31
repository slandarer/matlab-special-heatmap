function [X,Y]=SClusterBlock(Class,varargin)
% Zhaoxu Liu / slandarer (2023). special heatmap 
% (https://www.mathworks.com/matlabcentral/fileexchange/125520-special-heatmap), 
% MATLAB Central File Exchange. 检索来源 2023/3/1.
obj.arginList={'Orientation','MinLim','Parent','ColorList','BlockProp'};
obj.Orientation='top';
obj.MinLim=0;
obj.Parent=gca;
obj.BlockProp={'LineWidth',.8};
obj.ColorList=...
    [0.5529    0.8275    0.7804
    1.0000    1.0000    0.7020
    0.7451    0.7294    0.8549
    0.9843    0.5020    0.4471
    0.5020    0.6941    0.8275
    0.9922    0.7059    0.3843
    0.7020    0.8706    0.4118
    0.9882    0.8039    0.8980
    0.8510    0.8510    0.8510
    0.7373    0.5020    0.7412
    0.8000    0.9216    0.7725
    1.0000    0.9294    0.4353];
obj.ColorList=[obj.ColorList;rand(max(Class),3)./5+.5];
% 获取其他数据
for i=1:2:(length(varargin)-1)
    tid=ismember(obj.arginList,varargin{i});
    if any(tid)
        obj.(obj.arginList{tid})=varargin{i+1};
    end
end
obj.Parent.XColor='none';
obj.Parent.YColor='none';
obj.Parent.XTick=[];
obj.Parent.YTick=[];
obj.Parent.NextPlot='add';
Class=Class(:).';
CCList=[0,find([diff(Class),1]~=0)];
if isequal(obj.Orientation,'top')
    X=zeros([1,length(CCList)-1]);
    Y=ones([1,length(CCList)-1]).*(obj.MinLim+.5);
else
    X=ones([1,length(CCList)-1]).*(obj.MinLim+.5);
    Y=zeros([1,length(CCList)-1]);
end
for i=1:length(CCList)-1
    CL=[CCList(i)+1,CCList(i+1)];
    
    if isequal(obj.Orientation,'top')
        fill(obj.Parent,CL([1,2,2,1])+[-.5,.5,.5,-.5],[obj.MinLim,obj.MinLim,obj.MinLim+1,obj.MinLim+1],...
            obj.ColorList(Class(CCList(i)+1),:),obj.BlockProp{:})
        X(i)=(CL(1)+CL(2))/2;
    else
        fill(obj.Parent,[obj.MinLim,obj.MinLim,obj.MinLim+1,obj.MinLim+1],CL([1,2,2,1])+[-.5,.5,.5,-.5],...
            obj.ColorList(Class(CCList(i)+1),:),obj.BlockProp{:})
        obj.Parent.YDir='reverse';
        Y(i)=(CL(1)+CL(2))/2;
    end
end
axis tight
end