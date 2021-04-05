function out = trackError(x, Fs)

out = x;
counterRepetitions = 0;

for k = Fs*2:44100:length(x)-Fs*2
    random = rand(1);
    if random > 0.9
        repeatedVec = repmat(x(k:k+Fs*2), round(rand(1) * 2), 1);
        repeatedVec = reshape(repeatedVec, [numel(repeatedVec), 1]);
        
        out = vertcat(out(1:k+counterRepetitions-1), repeatedVec, out(k+counterRepetitions:end));
      
        counterRepetitions = counterRepetitions + length(repeatedVec);
    end
end
    




end

