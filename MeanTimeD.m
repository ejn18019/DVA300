function [Mean] = MeanTimeD(Finished)
%UNTITLED3 Summary of this function goes here
%   This function calculates the mean value of how long all finshed
%   streamers have spent downloading
Mean=0;
for i=2:length(Finished)
    Mean=Finished(i).TimeD+Mean;
end
Mean=Mean/(length(Finished)-1);
end

