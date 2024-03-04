function [pdbData] = A2_chooseFile
%Function: reads chosen pdb file.
%No input. 
%Output(pdbData) = pdb data files(struct).
[Name,Path] = uigetfile('.ent'); %Fetch pdb get name & path
fullfile(Path,Name);
pdbData = pdbread([Path,Name]);
end