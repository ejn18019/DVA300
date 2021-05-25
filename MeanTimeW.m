function [Mean] = MeanTimeW(Finished)
%UNTITLED3 Summary of this function goes here
%   This function calculates the mean value of how long all finshed
%   streamers have spent waiting
Mean=0;
for i=2:length(Finished)
    Mean=Finished(i).TimeW+Mean;
end
Mean=Mean/(length(Finished)-1);
end
