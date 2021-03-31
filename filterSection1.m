function filteredAudio = filterSection1(audioIn)

    SOS_filter1 = butterworth(44100, 9000, 12000, 0.45, 13);

    [bCoeff, aCoeff] = sos2tf(SOS_filter1.sosMatrix);

    productScaleValue = prod(SOS_filter1.scaleValues);

    bCoeff = bCoeff .* productScaleValue;
    
    filteredAudio = filter(bCoeff, aCoeff, audioIn);

end