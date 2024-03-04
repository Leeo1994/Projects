function [mat] = J2_coords(structArr) 
%Function: Creates a numerical coordinate array from struct array fields. 
%Input(structArr) = struct array. in each struct -> field(1) = coordinates(XYZ).
%Output(mat) = a 3-col, n-row matrice. (n = no' of atoms).
xCol = [structArr.X]'; %collects X,Y,Z from 1st field in every struct in array & creates col array
yCol = [structArr.Y]';
zCol = [structArr.Z]';
mat = [xCol yCol zCol]; %merge cols to a 2D 3-col array (matrix).
end