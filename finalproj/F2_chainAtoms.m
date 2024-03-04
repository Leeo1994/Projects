function [cidStruct] = F2_chainAtoms(structArr,cId) 
%Function: pulls data relevant to a specific chain (when there are multiple chains)
%Input1(structArr) = Struct array, each contains the field "chainID".
%Input2(cId) = Chain identifier (1 note)
%Output(idStruct) = structArr, but only the fields with the specified chainID 
idArray = char(structArr.chainID); %(chainID = 1 note)  
logicArray = idArray==cId;
cidStruct = structArr(logicArray==1);
end

