clc; clear all;
dataFile = A2_chooseFile;
hetId = {dataFile.HeterogenName.hetID}; %hetId(identifier) extracted from each sturcture in array 
hId = dataFile.HeterogenName(1,1).hetID; %hId = hetId of 1st HeterogenName
hId = strtrim(hId);
fAtom = B2_substanceAtoms(dataFile.Model.HeterogenAtom,hId);
[cCode, fCode] = D2_chainForeign(dataFile); %fCode = foreign code, cCode = chain code
proteinAtom = F2_chainAtoms(dataFile.Model.Atom, cCode);
fAtom = F2_chainAtoms(dataFile.Model.HeterogenAtom, cCode);
struct = struct('minimalDistance',[],'maximalDistance',[]);
struct.minDist = 5;
struct.maxDist = 30;
inputH = H2_popDist(struct); 
relevantAtoms = F2_chainAtoms(fAtom,cCode); %pull relevant atoms of certain chains (for multiple chains)
mat = J2_cords(relevantAtoms); %pulls X,Y,Z values -> creates matrice. 
scatter3(mat(:,1),mat(:,2),mat(:,3));
xlabel('X') ;
ylabel('Y');
zlabel('Z');