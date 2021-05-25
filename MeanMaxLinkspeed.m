function [Mean] = MeanMaxLinkspeed(Finished)
%UNTITLED3 Summary of this function goes here
%   This function calculates the mean value of total maximal linkspeed per
%   user.
Mean=0;
for i=2:length(Finished)
    Mean=Finished(i).Lmax+Mean;
end
Mean=Mean/(length(Finished)-1);
end

