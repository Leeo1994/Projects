function newdistStruct = H2_popDist(distStruct)
%Function: receives two numbers from user via popup window. 
%Input(distStruct) = struct w/distance fields.
%Output(newdistStruct) = struct w/same field names as input.
newdistStruct = distStruct;
popTitles = {'minimal distance','maximal distance'}; %popup window titles
parameters = [distStruct.minDist, distStruct.maxDist];
outputD8 = d8params(popTitles,parameters); %user output via d8params
newdistStruct.minDist = outputD8(1);
newdistStruct.maxDist = outputD8(2);
