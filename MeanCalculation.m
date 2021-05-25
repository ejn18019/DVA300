function MeanStruct = MeanCalculation(MeanStruct,Finished,i)

    MeanStruct(i).MeanTimeD = MeanTimeD(Finished);
    MeanStruct(i).MeanTimeW = MeanTimeW(Finished);
    MeanStruct(i).MeanData = MeanData(Finished);
    MeanStruct(i).MeanMaxLinkspeed = MeanMaxLinkspeed(Finished);
    MeanStruct(i).FinishedUsers = length(Finished)-1;
end

