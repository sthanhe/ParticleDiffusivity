%% Analysis of Particle Size Distribution
%GNU General Public License v3.0
%By Stefan Thanheiser: https://orcid.org/0000-0003-2765-1156
%
%Part of the paper:
%
%Thanheiser, S.; Haider, M.
%Particle Mass Diffusion Model for Level Control of Bubbling Fluidized Beds
%with Horizontal Particle Flow
%Powder Technology 2023
%
%All data, along with methodology reports and supplementary documentation, 
%is published in the data repository:
%https://doi.org/10.5281/zenodo.7924694
%
%All required files for this script can be found in the software
%repository:
%https://doi.org/10.5281/zenodo.xxxxxxx
%
%
%
%This script calculates the mean particle diameter from the data in the 
%particle supplier's data sheet.
%
%
%Requires all auxiliary classes and functions on the MATLAB path
%
%Required products:
%   - MATLAB, version 9.14
%Necessary files, classes, functions, and scripts:
%   - None


%% Set figure directory
dirFigures='Figures';       %Path to directory where figures should be stored

%Create directory if it does not exist
if ~isfolder(dirFigures)
    mkdir(dirFigures);
end


%% Analysis
mesh=[425,300,212,150,106,75,53,0]*10^-6;   %Mesh sizes
resid=[0,2.2,14.7,47.5,28.8,6.4,0.4,0]/100; %Residues in each pan

meshmean=movmean(mesh,[1,0]);   %Mean particle size between each mesh, assuming linear distribution

d_p=sum(resid.*meshmean);    %Mean particle diameter


%Set up figure
fig=figure(1);
clf(fig);
ax=gca();
box(ax,'on');

plot(ax,[mesh;meshmean],resid);

legend(ax,{'Sieve','Linear'},'Location','best');

title(ax,'Particle size distribution, GRANUSIL, Wedron IL \#801, Grade 7020','Interpreter','latex');
xlabel(ax,'Mesh size (m)','Interpreter','latex');
ylabel(ax,'Retained mass fraction (-)','Interpreter','latex');

fig.Units='centimeters';
fig.Position=[10,5,17,8.5];
ax.XLim=[0,max(mesh)];

exportgraphics(fig,[dirFigures,filesep,'particleSize.tiff']);




