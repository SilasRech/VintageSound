function filteredAudio = filterSection2(audioIn, Fs, type_filt)
    
     if type_filt == "LP"
         Fpass = 4000;
         Fstop = 18000;
         Apass = 0.46;
         Astop = 10; 
     else
         Fpass = 2000;
         Fstop = 7500;
         Apass = 0.46;
         Astop = 20; 
    end
    
    SOS_filter2 = butterworth(Fs, Fpass, Fstop, Apass, Astop);

    [bCoeff, aCoeff] = sos2tf(SOS_filter2.sosMatrix);

    productScaleValue = prod(SOS_filter2.scaleValues);

    bCoeff = bCoeff .* productScaleValue;
    
    filteredAudio = filter(bCoeff, aCoeff, audioIn);
    
end
