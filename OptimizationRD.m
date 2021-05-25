function LS = OptimizationRD(Streamers,Bandwidth)
Cap = 0;
NumberOfStreamers = length(Streamers); 
TT = 0;
x0 = struct('L',0);
 

if NumberOfStreamers >= floor(Bandwidth / Streamers(1).Lmin)%Does not work with
%different sizes of L_min. When sizes are different: create for loop to sum
%up all L_min. 
Cap = floor(Bandwidth / Streamers(1).Lmin);
else
Cap = NumberOfStreamers;
end


for i=1:Cap
VectorD(i) = Streamers(i).data ; %Our f for linprog
VectorLmin(i) = Streamers(i).Lmin; %lb for linprog
if Streamers(i).data < Streamers(i).Lmax
    if Streamers(i).data <= Streamers(i).Lmin
        VectorLmax(i) = Streamers(i).Lmin;
    else
        VectorLmax(i) = Streamers(i).data;
    end
else
VectorLmax(i) = Streamers(i).Lmax; %ub for lin prog
end
VectorSD(i) = Streamers(i).TimeD;
x0.L(i) = VectorLmax(i);
end
prob = optimproblem;
L = optimvar("L",Cap,"LowerBound",VectorLmin,"UpperBound",VectorLmax);
prob.Objective = sum(VectorD - (L'.* VectorSD));
prob.Constraints.BandWidth = sum(L) <= Bandwidth;

Linkspeed = solve(prob,x0);
for i = 1:Cap
    LS(i) = Linkspeed.L(i);
end

end



