function sidArray = B2_substanceAtoms(sArray,id) 
%Function: extracts atoms belonging to a certain substance according to substance ID. 
%Input1(sArray) = Structure array (structure = atom data)
%Input2(id) = Substance identifier
%Output(sidArray) = Structure array of atoms w/requested id.
cellArray = {sArray.resName}; %Collects the resName field from all structures
cellArray = strtrim(cellArray); %Removes spaces from all names in cell array
i = strcmp(id,cellArray); %Comparison between the id and each of the cells
index = find(i==1);
sidArray = sArray(index);
end