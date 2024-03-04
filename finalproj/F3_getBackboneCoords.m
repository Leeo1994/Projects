function dArray = F3_getBackboneCoords(struc)
%Function: pulls out the backbone coordinates data of a chain
%Input(struc) =  a structure for data selected by the user
%output(dArray) = 2D array, 3 columns, backbone atoms only (X,Y,Z coordinates).
indexAc = struc.ifirstAtom;
firstrow = indexAc;
secrow = indexAc+1;
thirdrow = indexAc +2;
mat = [firstrow;secrow;thirdrow];
%reshape command to arrange the elements in the two-dimensional array(mat)in a one-dimensional column array
NEWmat = reshape(mat,[],1);
%Extract the structures (atoms) belonging to the backbone from the protein
%chain atoms field found in struc (in the input arg)
pbackbone = struc.chainAtoms(NEWmat);
dArray = J2_coords(pbackbone);
end

