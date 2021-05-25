function [Finished] = FinishedStruct(Finished,Streamers)
%UNTITLED12 Summary of this function goes here
%   This fuction takes a vector of structs and copies all finshed downloads
%   into a new struct and the returns it.
n=length(Finished)+1;
for i=1:length(Streamers)
    if(Streamers(i).data <=0)
        Finished(n)=Streamers(i);
        n=n+1;
    end

end

