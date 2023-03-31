% 基础使用(Basic use)
if ~exist('gallery\','dir')
    mkdir('gallery\')
end
%% 绘制无负数的热图(Draw positive heat map)
figure()
Data=rand(15,15);
SHM1=SHeatmap(Data,'Format','sq');
SHM1=SHM1.draw();
% exportgraphics(gca,'gallery\Basic_positive.png')

%% 绘制有负数热图(Contains negative numbers)
figure()
Data=rand(15,15)-.5;
SHM2=SHeatmap(Data,'Format','sq');
SHM2=SHM2.draw();
% exportgraphics(gca,'gallery\Basic_negative.png')

%% 绘制不同大小热图(Draw heat maps of different sizes)
figure()
Data=rand(25,30);
SHM4=SHeatmap(Data,'Format','sq');
SHM4=SHM4.draw();
% exportgraphics(gca,'gallery\Basic_25_30.png')

%% 调整colorbar位置(Adjust the colorbar Location)
figure()
Data=rand(3,12);
SHM5=SHeatmap(Data,'Format','sq');
SHM5=SHM5.draw();
CB=colorbar;
CB.Location='southoutside';
% exportgraphics(gca,'gallery\Basic_colorbar_location.png')

%% 绘制有NaN热图(Draw heat map with NaN)
figure()
Data=rand(12,12)-.5;
Data([4,5,13])=nan;
SHM6=SHeatmap(Data,'Format','sq');
SHM6=SHM6.draw();
% exportgraphics(gca,'gallery\Basic_with_NaN.png')

%% 绘制有文本热图(Draw heat map with texts)
figure()
Data=rand(12,12)-.5;
Data([4,5,13])=nan;
SHM7=SHeatmap(Data,'Format','sq');
SHM7=SHM7.draw();
SHM7.setText();
% exportgraphics(gca,'gallery\Basic_with_text.png')

%% 绘制带标签热图(Draw heat map with labels)
figure()
Data=rand(12,12);
SHM8=SHeatmap(Data,'Format','sq');
SHM8=SHM8.draw(); 
ax=gca;
ax.XTickLabel={'X-1','X-2','X-3','X-4','X-5','X-6','X-7','X-8','X-9','X-10','X-11','X-12'};
ax.YTickLabel={'Y-1','Y-2','Y-3','Y-4','Y-5','Y-6','Y-7','Y-8','Y-9','Y-10','Y-11','Y-12'};
ax.FontSize=14;
% exportgraphics(gca,'gallery\Basic_with_labels.png')