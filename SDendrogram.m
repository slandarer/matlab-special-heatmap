function order=SDendrogram(Data,varargin)
% Zhaoxu Liu / slandarer (2023). special heatmap 
% (https://www.mathworks.com/matlabcentral/fileexchange/125520-special-heatmap), 
% MATLAB Central File Exchange. 检索来源 2023/3/1.
obj.arginList={'Orientation','Parent','Method'};
obj.Orientation='top';
% obj.MinLim=0; 
obj.Parent=gca;
obj.DataLen=0;
obj.Method='average';
% 获取其他数据
for i=1:2:(length(varargin)-1)
    tid=ismember(obj.arginList,varargin{i});
    if any(tid)
        obj.(obj.arginList{tid})=varargin{i+1};
    end
end
figure();
if isequal(obj.Orientation,'top')
    tree=linkage(Data.',obj.Method);
else
    tree=linkage(Data,obj.Method);
end
[treeHdl,~,order]=dendrogram(tree,0,'Orientation',obj.Orientation);
set(treeHdl,'Color',[0,0,0]);
set(treeHdl,'LineWidth',.8);
tempFig=treeHdl(1).Parent.Parent;
% 坐标区域修饰
axTree=copyAxes(tempFig,1,obj.Parent);obj.Parent
axTree.XColor='none';
axTree.YColor='none';
axTree.XTick=[];
axTree.YTick=[];
axTree.NextPlot='add';
delete(tempFig);
switch obj.Orientation
    case 'top'
        obj.DataLen=size(Data,2);
        axTree.XLim=[1,obj.DataLen]+[-.5,.5];
    case 'left'
        obj.DataLen=size(Data,1);
        axTree.YDir='reverse';
        axTree.YLim=[1,obj.DataLen]+[-.5,.5];
end
% -------------------------------------------------------------------------
    function axbag=copyAxes(fig,k,newAx)
        % @author : slandarer
        % 公众号  : slandarer随笔
        % 知乎    : slandarer
        %
        % 此段代码解析详见公众号 slandarer随笔 文章：
        %《MATLAB | 如何复制figure图窗任意axes的全部信息？》
        % https://mp.weixin.qq.com/s/3i8C78pv6Ok1cmEZYPMyWg
        classList(length(fig.Children))=true;
        for n=1:length(fig.Children)
            classList(n)=isa(fig.Children(n),'matlab.graphics.axis.Axes');
        end
        isaaxes=find(classList);
        oriAx=fig.Children(isaaxes(end-k+1));
        if isaaxes(end-k+1)-1<1||isa(fig.Children(isaaxes(end-k+1)-1),'matlab.graphics.axis.Axes')
            oriLgd=[];
        else
            oriLgd=fig.Children(isaaxes(end-k+1)-1);
        end
        axbag=copyobj([oriAx,oriLgd],newAx.Parent);
        axbag(1).Position=newAx.Position;
        delete(newAx)
    end
end