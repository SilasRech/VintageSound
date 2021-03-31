function filteredAudio = filterSection2(audioIn)

    SOS_filter2 = butterworth(44100, 4000, 18000, 0.46, 10);

    [bCoeff, aCoeff] = sos2tf(SOS_filter2.sosMatrix);

    productScaleValue = prod(SOS_filter2.scaleValues);

    bCoeff = bCoeff .* productScaleValue;
    
    filteredAudio = filter(bCoeff, aCoeff, audioIn);
    
end
