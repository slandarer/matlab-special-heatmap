% 树状图及分组(Tree and Group)

% 随便捏造了点数据(Made up some data casually)
X1=randn(20,20)+[(linspace(-1,2.5,20)').*ones(1,8),(linspace(.5,-.7,20)').*ones(1,5),(linspace(.9,-.2,20)').*ones(1,7)];
X2=randn(20,25)+[(linspace(-1,2.5,20)').*ones(1,15),(linspace(.5,-.7,20)').*ones(1,5),(linspace(.9,-.2,20)').*ones(1,5)];
% 求相关系数矩阵(Get the correlation matrix)
Data=corr(X1,X2);
% rowName and colName
rowName={'FREM2','ALDH9A1','RBL1','AP2A2','HNRNPK','ATP1A1','ARPC3','SMG5','RPS27A',...
          'RAB8A','SPARC','DDX3X','EEF1D','EEF1B2','RPS11','RPL13','RPL34','GCN1','FGG','CCT3'};
colName={'A1','A2','A3','A4','A5','A6','A7','A8','A9','A10','A11','A12','A13',...
         'A14','A15','B16','B17','B18','B19','B20','C21','C22','C23','C24','C25'};
% Set Color
CList=[0.7020    0.8863    0.8039
    0.9559    0.8142    0.6907
    0.8451    0.8275    0.8510
    0.8966    0.8083    0.9000];

% 图窗创建(create figure)
fig=figure('Position',[100,100,870,720]);

% 调整主坐标区域位置并将Y轴置于右侧
% Adjust the position of the main coordinate area 
% and place the Y axis to the right
axMain=axes('Parent',fig);
axMain.Position=[.18,.07,.62,.77];
P=axMain.Position;
axMain.YAxisLocation='right';

% 绘制左侧树状图(Draw the left dendrogram)
axTreeL=axes('Parent',fig);
axTreeL.Position=[P(1)-P(3)/5,P(2),P(3)/5*(5/6),P(4)];
orderL=SDendrogram(Data,'Orientation','left','Parent',axTreeL,'Method','average');

% 绘制顶部树状图(Draw the top dendrogram)
axTreeT=axes('Parent',fig);
axTreeT.Position=[P(1),P(2)+P(4)+P(4)/5*(1/6),P(3),P(4)/5*(5/6)];
orderT=SDendrogram(Data,'Orientation','top','Parent',axTreeT,'Method','average');

% 绘制左侧分组方块(Draw the left Block)
axBlockL=axes('Parent',fig);
axBlockL.Position=[P(1)-P(3)/5+P(3)/5*(5/6),P(2),P(3)/5*(1/6),P(4)];
ZL=linkage(Data,'average');
CL=cluster(ZL,'Maxclust',4);
CL=CL(orderL);
SClusterBlock(CL,'Orientation','left','Parent',axBlockL,'ColorList',CList);

% 绘制顶部分组方块(Draw the top Block)
axBlockT=axes('Parent',fig);
axBlockT.Position=[P(1),P(2)+P(4),P(3),P(4)/5*(1/6)];
ZT=linkage(Data.','average');
CT=cluster(ZT,'Maxclust',4);
CT=CT(orderT);
SClusterBlock(CT,'Orientation','top','Parent',axBlockT,'ColorList',CList);

% 交换数据顺序(Exchange data order)
Data=Data(orderL,:);
Data=Data(:,orderT);

% 绘制热图(Draw Heatmap)
SHM_t1=SHeatmap(Data,'Format','sq','Parent',axMain);
SHM_t1=SHM_t1.draw();
axMain.DataAspectRatioMode='auto';
axMain.XTickLabel=colName(orderT);
axMain.YTickLabel=rowName(orderL);
CB=colorbar(axMain);
CB.Position=[P(1)+P(3)*1.15,P(2)+P(4)/2,P(3)/25,P(4)/2];
exportgraphics(gcf,'gallery\TreeGroup.png')