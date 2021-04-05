function [bCoeff, aCoeff] = hissFilter(HMax, HMin)
    r = HMax ./ HMin; 

    a1 = (1-r)./(1+r); 
    b0 =  (1-a1) .* HMin;
    
    bCoeff = [b0, 0, 0];
    aCoeff = [1, a1, 0];
 
end