function [indexfirstAtom, indexlastAtom] = A3_aaBoundAtoms(strucArray) 
%Function: identifies the atoms at the beginning and end of each amino acid
%Input(strucArray) = struct array w/info about amino acid atoms in a particular chain
%Output1(indexfirstAtom) = numeric array w/index of first atom
%Output2(indexlastAtom) = numeric array w/index of last atom
numArray = [strucArray.resSeq]; %collect resSeq field from all structs and create num array.
i=numArray(1:end-1) == numArray(2:end); %comparison between i to i+1
%The places of change are the end of the amino acids
ilastAtom = find(i==0);
indexlastAtom = [ilastAtom,length(numArray)];
indexfirstAtom = [1,(ilastAtom)+1];
end

