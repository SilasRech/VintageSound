function filteredAudio = filterSection1(audioIn, Fs, type_filt)

    if type_filt == "LP"
         Fpass = 9000;
         Fstop = 12000;
         Apass = 0.45;
         Astop = 13; 
    end
    
    SOS_filter1 = butterworth(Fs, Fpass, Fstop, Apass, Astop);

    [bCoeff, aCoeff] = sos2tf(SOS_filter1.sosMatrix);

    productScaleValue = prod(SOS_filter1.scaleValues);

    bCoeff = bCoeff .* productScaleValue;
    
    filteredAudio = filter(bCoeff, aCoeff, audioIn);

end