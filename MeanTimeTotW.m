function [MeanTotW] = MeanTimeTotW(MeanTable)
%MEANTIMETOTW Summary of this function goes here
%   Detailed explanation goes here
MeanTotW = 0;
for i = 1:length(MeanTable)
    MeanTotW = MeanTable(i).MeanTimeW + MeanTotW;
end
MeanTotW = MeanTotW / length(MeanTable);
end

