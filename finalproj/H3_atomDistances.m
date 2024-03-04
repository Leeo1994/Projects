function mat = H3_atomDistances(struc)
%Function: calculates the distances between each atom in the amino acid chain and every atom in the ligand
%Input(struc) = Structure containing the selected data.
%Output(mat) = A matrix is generated with the number of rows equal to the number of ligand atoms 
%and the number of columns equal to the number of protein atoms.
matCA = J2_coords(struc.chainAtoms); %CA - chain atoms
matLA = J2_coords(struc.ligandAtoms); %LA - ligand atoms
%Using the function from the course files d10dist
mat = d10dist(matLA,matCA);
end

