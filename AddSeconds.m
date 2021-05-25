function [Streamers] = AddSeconds(Streamers,cap)
%UNTITLED10 Summary of this function goes here
%   streamers is the array of structs it can be seen as a stack, this
%   fuction adds one second to all streamers


L=length(Streamers);
for i=1:L
    if i <=cap
        Streamers(i).TimeD=Streamers(i).TimeD+1;
    else 
        Streamers(i).TimeW=Streamers(i).TimeW+1;
    end
end
