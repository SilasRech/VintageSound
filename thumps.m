function out = thumps(input, Fs)

click = - 0.7 + zeros(round(0.0001 * Fs), 1);
timeSine = 0 : 1 / Fs : 0.3 - 1 / Fs;
Fc = 10;
oscillation = 0.3 * sin(2 * pi * Fc * timeSine) - 0.2;
oscillation = (oscillation .* exp(-timeSine * 15))';

thump = [zeros(round(0.03 * Fs), 1); click; oscillation];

out = input;

for k = Fs*2:44100:length(input)-Fs*2
    random = rand(1);
    if random > 0.8 
        out(k:k+length(thump)-1) = out(k:k+length(thump) -1 ) + thump;
     
    end
end

% artefacts = -0.005 + (0.005 + 0.005) * rand(length(thump), 1);
% 
% timeAxis = linspace(0, length(thump) / Fs, length(thump));
% 
% figure
% plot(timeAxis, thump);
% ylim([-1, 1]);

