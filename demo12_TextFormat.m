% 数值文本格式(Text Format)

% 随便捏造了点数据(Made up some data casually)
X=randn(20,15)+[(linspace(-1,2.5,20)').*ones(1,6),(linspace(.5,-.7,20)').*ones(1,5),(linspace(.9,-.2,20)').*ones(1,4)];
% 求相关系数矩阵(Get the correlation matrix)
Data=corr(X);

% 图窗创建(create figure)
fig=figure('Position',[100,100,870,720]);

% 绘制有文本热图(Draw heat map with texts)
SHM12=SHeatmap(Data,'Format','sq');
SHM12=SHM12.draw();
SHM12.setText();

% 调整数值文本格式(Set text format)
SHM12.setTextFormat(@(x)sprintf('%0.1f',x))
% exportgraphics(gca,['gallery\Text_Format_','0.1f','.png'])

% SHM12.setTextFormat(@(x)sprintf('%0.1fS',x))
% exportgraphics(gca,['gallery\Text_Format_','0.1fS','.png'])
% SHM12.setTextFormat(@(x)sprintf('%0.1e',x))
% exportgraphics(gca,['gallery\Text_Format_','0.1e','.png'])
