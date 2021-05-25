function [User] = Getdata(User)
%UNTITLED4 Summary of this function goes here
%   this function is going to set a value to amount of data
%Data=((rand(1)*40)+30)*(30+(120*rand(1)));%netflix offers resolutions in 3,..,7 gb/h, the ammount is a randomized

%Updated. Medium resolution times the lenght of content(in seconds)
Data=0.1944*((40*60)+((80*60)*rand(1)));
%Data = 100+(900*rand(1)); 
%resolution times the length of content in hours
User.data=Data;
User.StartData=Data;
end

