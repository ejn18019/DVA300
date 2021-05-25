function [Streamers] = SortStruct(Streamers)
%UNTITLED8 Summary of this function goes here
%   this function takes a array of structs and sorts them after the amount
%of seconds. it will sort the array with most seconds first to least
%seconds 
SortT = struct2table(Streamers);
sortedT= sortrows(SortT,'time','descend');
for i = 1:length(Streamers)
   Streamers(i).data = sortedT(i,1).data;
   Streamers(i).ls = sortedT(i,2).ls;
   Streamers(i).time = sortedT(i,3).time;
end



