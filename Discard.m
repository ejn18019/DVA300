function [NewArray] = Discard(Streamers)
%UNTITLED2 Summary of this function goes here
%   This function discards all elements that have Streamers(i).data<=0. it
%   performs this by copying all the other elements into a new array which
%   it later returns
n=length(Streamers);
k=1;

for i=1:n
    if Streamers(i).data >0
        NewArray(k)=Streamers(i);
        k=k+1;
    end
end
end

