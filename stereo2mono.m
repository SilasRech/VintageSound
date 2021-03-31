function audioMono = stereo2mono(audioIn)

    leftChannel = audioIn(:, 1);
    rightChannel = audioIn(:, 2); 

    audioMono = mean(leftChannel, rightChannel);
    
end