function [chainId,fId] = D2_chainForeign(input) %chooses chain and foreign substance
%Function:
%Input() = a pdb data struct.
%Output1(chainId) = char array - chain identifier  
%Output2(fId) = char array - foreign body identifier 
chemCell = {input.HeterogenName.ChemName}; 
chemCell = strtrim(chemCell); 
if length(chemCell) <= 1 %for a single foreign substance
    ligandNum = 1;
else
chooseLigand = listdlg('ListString',chemCell, 'SelectionMode', 'single'); %for multiple foreign substances user gets to choose.
ligandNum = chooseLigand;
end
fId = (input.HeterogenName(ligandNum).hetID); %fId - check foreign substance's chain
fId = strtrim(fId); 
fId = char(fId); 
fAtoms = B2_substanceAtoms((input.Model.HeterogenAtom),fId); %B2_substanceAtoms - pulls atoms belonging to certain substance
chainCell = {fAtoms.chainID};
chainList = unique(chainCell); %chain identifiers list the user gets to choose from.
if length(chainList) <= 1 %for single foreign atom
chainId = chainList(1);
else chooseChain = listdlg("ListString",chainList, 'SelectionMode', 'single'); %for multiple foreign atoms user gets to choose.
    chainId = chainList(chooseChain);
end 
chainId = char(chainId); 
end
