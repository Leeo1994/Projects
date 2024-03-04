function [SameHeterogenName] = B3_mat2Row(HeterogenName) 
%Function: The function reshapes a matrix of characters, representing a long foreign substance into a single row
%Input(HeterogenName) = A structure of type HeterogenName, containing various fields including ChemName
%Output(SameHeterogenName) = A structure with consistent field names, 
%where the ChemName field is a row array of characters
SameHeterogenName = HeterogenName;
ChemName = HeterogenName.ChemName;
%using the function d7line from the course.
d7lineoutput = d7line(ChemName);
SameHeterogenName.ChemName = d7lineoutput;
end
