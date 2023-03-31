% 各类型热图绘制(Preparation of various Format of heat maps)
if ~exist('gallery\','dir')
    mkdir('gallery\')
end
% sq    : square (default)   : 方形(默认)
% pie   : pie chart          : 饼图   
% circ  : circular           : 圆形
% oval  : oval               : 椭圆形
% hex   : hexagon            ：六边形
% asq   : auto-size square   ：自带调整大小的方形
% acirc : auto-size circular ：自带调整大小的圆形

Format={'sq','pie','circ','oval','hex','asq','acirc'};
A=rand(12,12);
B=rand(12,12)-.5;

for i=1:length(Format)
    % 绘制纯正数热图(Draw positive heat map)
    figure();
    SHM_A=SHeatmap(A,'Format',Format{i});
    SHM_A=SHM_A.draw();
    % exportgraphics(gca,['gallery\Format_',Type{i},'_A.png']) % 存储图片

    % 绘制含负数热图(Draw heat map with negative number)
    figure();
    SHM_B=SHeatmap(B,'Format',Format{i});
    SHM_B=SHM_B.draw();
    % exportgraphics(gca,['gallery\Format_',Type{i},'_B.png']) % 存储图片
end
% close all