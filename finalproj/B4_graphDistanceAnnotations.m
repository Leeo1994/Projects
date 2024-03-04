function [] = B4_graphDistanceAnnotations(userData,distMat,minmaxDist)
%Function: graphic presentation of mutual distances + annotation of foreign body atoms and amino acids 
%Input(userData) = struct array chosen by user
%Input(distMat) = distance matrix
%Input(minmaxDist) = struct w/2 fields - min & max
exdistMat = ex5_2mat(distMat);
pcolor(exdistMat);
shading flat;
colormap('pink');
%Setting the color mapping so that the minimum and maximum are
%as specified in the minimum and maximum fields in the third input argument
caxis([minmaxDist.minDist, minmaxDist.maxDist]);
colorbar;
titleX = ['chain ', (userData.chainID)];
xlabel(titleX);
titleY = ['Ligand', userData.ligandAtoms(1).resName];
ylabel(titleY);
minD = num2str(minmaxDist.minDist);
titleprep = ['file:' ' ' userData.idCode ' ' 'cutoff:' ' ' minD];
title(titleprep);
fatomName = {userData.ligandAtoms.AtomName};
%Adding the data to the X axis and the Y axis
xticks(userData.ifirstAtom);
xticklabels(userData.acNames);
xtickangle(90);
yticks(1:1:length(fatomName));
yticklabels(fatomName);
end