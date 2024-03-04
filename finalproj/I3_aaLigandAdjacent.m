function indexamino = I3_aaLigandAdjacent(struc,distmat,mindist)
%Function: Identifies amino acids in close proximity to a foreign substance
%Input(struc) = A structure for data selected by the user
%Input(distmat) = Mutual distances matrix
%Input(mindist) = Minimum distance (bond length)
%Output(indexamino) = Indexes of amino acids in close proximity to the foreign substance
%Comparing distances to get a logical array
logicArray = distmat < mindist; %change 
%Using the any command in order to find which columns 
%have at least one element that is a logical truth
anyArray = any(logicArray,1);
%An array of identifiers for the amino acids in the binding site
relstruc = struc.chainAtoms(anyArray);
AtomsidCS = [relstruc.resSeq]; 
%An array of identifiers for all amino acids in the selected chain
strucArray = struc.chainAtoms(struc.ifirstAtom);
numericArray = [strucArray.resSeq]; 
%ismember command to find which of the identifiers for all amino acids
%in the selected chain are in the array of atom identifiers in the bond site.
logicalArray = ismember(numericArray,AtomsidCS); 
indexamino = find(logicalArray==1);
end

