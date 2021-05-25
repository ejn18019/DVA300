%DVA 300 simulation of cloud access
%this simulation will simulate users accsesing content from a streaming
%service that adopts a cloud based buisness model

%this basically works now 21/02-21. add some functions for mean value and
%also what amount of data each user started with

%steps of simulation 
% initaion: streamers may be created
% step 1: checks if bandwidth is full , marks capped when its full
% step 2: downloads all streamers before the cap marker
% step 3: add seconds to all streamers in simulation
% step 4: puts finsished downloads in a new array
% step 5: generates new users

% should be a step between ? and ?+1 where finsished users are discarded, 

clear % clears workspace
Bandwidth=10000; %mps
Simulationtime=1000; % number of seconds we want to simulate
Numberofusers=20;
numberofstreamers=1;% a variable used to index streamers
ControlVarFin=0;
MeanTable = struct("MeanTimeD",0,"MeanTimeW",0,"MeanData",0,"MeanMaxLinkspeed",0,"FinishedUsers",0);


for j = 1:10
Streamers = struct('data',0,'ls',0,'TimeD',0,'TimeW',0,'StartData',0,'Lmin',0,'Lmax',0);
Finished=struct('data',0,'ls',0,'TimeD',0,'TimeW',0,'StartData',0,'Lmin',0,'Lmax',0);
numberofstreamers = 1;
for i=1:Numberofusers %initation
    
    Users(i)=Createauser();
    if rand(1)>=0
        Streamers(numberofstreamers)=Getdata(Users(i));
        Streamers(numberofstreamers)=Getlinkspeed(Streamers(numberofstreamers));
        numberofstreamers=numberofstreamers+1;
    end
end
for n=0:Simulationtime % this loop simulates one second of the cloud activity
       
       sum=0;
       sumI=1;
       cap=length(Streamers);
       
      OptLs=OptimizationRD(Streamers,Bandwidth); % optimizes each ls
       for k=1:length(OptLs)
           Streamers(k).ls=OptLs(k); %sets ls to a new linkspeed
       end
   
       while sum<Bandwidth && sumI<=length(Streamers)
           sum=Streamers(sumI).ls+sum;
           cap=sumI;
           sumI=sumI+1;
           
       end
       
       %this section doesent work cause last itteration will make cap=length(streamers)-1, use while loop
       %and end it when sum>=bandwidth. then cap will indicate which
       %elements that can download
       
       
   for i=1:cap % step 2: this loop simulates download for all streamers
          Streamers(i)= Download(Streamers(i));
   end
   
   if ~isempty(Streamers) % step 3
   Streamers=AddSeconds(Streamers,cap); % adds a second to all streamers,adding on TimeD/TimeW
   
   % step 4: check if any dowloads are finsihed
   ControlVarFin=AnyFinished(Streamers,cap);
   end
   
   if ControlVarFin== 1
      % step 5:  transfer done downloads
  Finished=FinishedStruct(Finished,Streamers);
  Streamers=Discard(Streamers);
   end
   % Streamers=SortStruct(Streamers); %step 5, seems to work but something
   % goes wrong
   
  
   if n > 0
   SumLinkspeed(n) = 0;
     for h = 1:length(Streamers)
         SumLinkspeed(n) = SumLinkspeed(n) + Streamers(h).ls;
     end
   end
   numberofstreamers=length(Streamers);
   for i=1:Numberofusers % step 6: this generates new streamers, last thing that happens
    if rand(1)>=0.1
        Streamers(numberofstreamers)=Getdata(Users(i));
        Streamers(numberofstreamers)=Getlinkspeed(Streamers(numberofstreamers));
        numberofstreamers=numberofstreamers+1;
    end
   end
   MeanTable = MeanCalculation(MeanTable,Finished,j); %Bytte ut j mot 1.
  
end
   plot(SumLinkspeed);
   hold on;
end
plot(ones(1,1000)*10000);
StreamersMeanTable(length(MeanTable)+1).MeanTimeW = MeanTimeTotW(MeanTable);

 %this one actually shows how long ALL finshed streamers have waited even those who didnt
%have to wait. this could be changed to show how long those who had to wait
%had to wait

%T = struct2table(MeanTable);
%writetable(T,'OptimisationResultRD.txt','Delimiter','\t','WriteRowNames',true);
%Issues with writetable. Can't make it look good in a txt file


