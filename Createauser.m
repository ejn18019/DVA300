function [User] = Createauser()
%UNTITLED3 Summary of this function goes here
%   this fuction is used to create a user each user will be represented as
%   a vector containing a link speed, a amount of data it wants to accses,
%   s counter that tells how many seconds the user have been
%   downloading,
User = struct('data',0,'ls',0,'TimeD',0,'TimeW',0,'Lmin',0,'Lmax',0); 
end

