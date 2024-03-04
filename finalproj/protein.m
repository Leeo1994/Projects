clear;
close all;

%3C
%using the function to select and read a file. 
data_all=A2_chooseFile;
cData = data_all; 
%Running the function to turn a matrix to one row.
cData.HeterogenName=arrayfun(@B3_mat2Row,data_all.HeterogenName);

x = 1;
while (x>=1)
    %loop in case the user wants to view the binding site for several
    %different choices of foreign substance and protein chain.
    [chainID,fID] = D2_chainForeign(cData);
    sampleCode = cData.Header.idCode;
    Generaltitle = [' file ' sampleCode ' chain ' chainID ' hetero ' fID];
    
    %3E
    %This part refers to the preparation of a structure for the data of the parts selected by the user
    databyUser=struct('idCode',[],'ligandID',[],'chainID',[],'ligandAtoms',[],'chainAtoms',[],'ifirstAtom',[],'ilastAtom',[],'acNames',[]);
    databyUser.ligandID = fID;
    databyUser.chainID = chainID;
    databyUser.idCode = sampleCode;
    temp = F2_chainAtoms(cData.Model.HeterogenAtom,databyUser.chainID);
    databyUser.ligandAtoms = B2_substanceAtoms(temp,databyUser.ligandID);
    databyUser.chainAtoms = F2_chainAtoms(cData.Model.Atom,databyUser.chainID);
    [databyUser.ifirstAtom,databyUser.ilastAtom] = A3_aaBoundAtoms(databyUser.chainAtoms);
    index = databyUser.chainAtoms(databyUser.ifirstAtom);
    cellArray = {index.resName};
    databyUser.acNames = strtrim(cellArray);
    %End 3E
    
    %3G
    %Finding the backbone of the selected chain and its graph
    backboneAtoms = F3_getBackboneCoords(databyUser);
    spatialDisp = figure('Name', 'Spatial Display of Backbone Atoms');
    x = backboneAtoms(:,1);
    y = backboneAtoms(:,2);
    z = backboneAtoms(:,3);
    plot3(x,y,z,'c-');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    axis equal
    title(Generaltitle);
    %3G
    
    %4A
    %Adding the foreign atoms to the graph of the backbone
    ligandCoords = J2_coords(databyUser.ligandAtoms); 
    lx = ligandCoords(:,1);
    ly = ligandCoords(:,2);
    lz = ligandCoords(:,3);
    hold on
    scatter3(lx,ly,lz,'k'); 
    %End 4A
    
    %4C
    %Commands for calculating distances and displaying them
    distMat = H3_atomDistances(databyUser);
    minDist = min(min(distMat));
    maxDist = max(max(distMat));
    histo = figure('Name', 'Distance histogram');
    spaceArray = linspace(minDist,maxDist,50);
    histogram(distMat,spaceArray);
    xlabel('distance');
    ylabel('counts');
    title(Generaltitle);
    heatMap = figure('Name', 'Heat map');
    distStruct.minDist = minDist;
    distStruct.maxDist = minDist*10;
    while (1>0)
        %An infinite loop for selecting a range of distances
        figure(histo);
        distStruct = H2_popDist(distStruct); 
        
        %4D
        %Commands for drawing the atoms of the amino acids participating in the binding site
        minDist = distStruct.minDist;
        acIndex = I3_aaLigandAdjacent(databyUser,distMat,minDist); 
        colormat = colormap(winter(length(acIndex)));
        figure(spatialDisp);
        bondacFirst = databyUser.ifirstAtom(acIndex);
        bondacLast = databyUser.ilastAtom(acIndex);
        series = (1:1:length(acIndex));
        for i = series
            %A loop that goes through each amino acid and paints the atoms in a 
            %specific color for each amino acid
             index = (bondacFirst(i):bondacLast(i));
             iAtom = databyUser.chainAtoms(index);
             coord = J2_coords(iAtom);
             color = colormat(i,:);
             xCoord = coord(:,1);
             yCoord = coord(:,2);
             zCoord = coord(:,3);
             scatter3(xCoord,yCoord,zCoord,'o','filled','MarkerFaceColor', color);
        end
        %Preparation of titles for the curves for a legend for the graph
        firstcurve = ['backbone', databyUser.chainID];
        secondcurve = databyUser.ligandID;
        othercurves = databyUser.acNames(acIndex);
        titles = [firstcurve, secondcurve, othercurves];
        legend(titles);
        
        figure(heatMap);
        clf(heatMap); %clear figure
        B4_graphDistanceAnnotations(databyUser,distMat,distStruct);
        quest = questdlg('change minimum/maximum distances?',Generaltitle);
        switch quest
            case 'No'
                 break
                 case ' Yes'
                     
        end
    end
        
    box = questdlg('rechoose a ligand and a chain from the chosen file?',Generaltitle);
    switch box
    case 'Yes' 
    close all;
    case 'No'
    break
    end
end

