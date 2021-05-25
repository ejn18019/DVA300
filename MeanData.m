function [Mean] = MeanData(Finished)
%UNTITLED3 Summary of this function goes here
%   This function calculates the mean value of the data to be acessed per
%   user

Mean=0;
for i=2:length(Finished)
    Mean=Finished(i).StartData+Mean;
end
Mean=Mean/(length(Finished)-1);
end

