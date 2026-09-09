%% Complex heatmap 4
% Inspired by : Fig. 1b
%     Wang, Y., Ma, A., Song, NJ. et al. 
%     Proteotoxic stress response drives T cell exhaustion and immune evasion. 
%     Nature 647, 1025–1035 (2025). https://doi.org/10.1038/s41586-025-09539-1
%
% PSR is triggered in Tex cells with a dynamic expression of chaperone proteins.

addpath('..\')

T = load('..\data_example\LCMV.mat');
SHM = SHeatmap(rand(5,5), 'Format','rrect');
SHM.draw()