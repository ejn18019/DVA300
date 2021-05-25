function [User] = Getlinkspeed(User)
%UNTITLED5 Summary of this function goes here
%  This function sets a value to linkspeedand and returns the selected user with its linkspeed altered 
%Linkspeed=(90*rand(1))+10;% this radomizes a linkspeed with a speed from 10-100mps
Linkspeed = 100+(400*rand(1));
User.ls=Linkspeed;
User.Lmax=Linkspeed;
User.Lmin=0.1944; %hardcoded , will be dependent on data
end

