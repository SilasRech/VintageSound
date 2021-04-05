function audioMono = stereo2mono(audioIn)
    
if size(audioIn, 2) > 1
    leftChannel = audioIn(:, 1);
    rightChannel = audioIn(:, 2); 

    audioMono = mean(leftChannel, rightChannel);
else
    audioMono = audioIn;
end
    
end