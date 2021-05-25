function [bool] = AnyFinished(Streamers, cap)
%UNTITLED Summary of this function goes here
%   this function checks if there is any finshed downlads in streamers
%   before the index cap, it returns true if it is and false otherwise, a
%   downloaad is finsihed if streamers(i).data<=0
bool=0;
for i=1:cap
    if Streamers(i).data <=0
        bool=1;
    end
end

