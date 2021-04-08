function [out] = hiss(input, Fs, hiss_ratio)

L = length(input);

noise = rand(L, 1);
Fc = 200; 

[bCoeff, aCoeff] = hissFilter(12, 0.5);

% [h, w] = freqz(bCoeff, aCoeff);

% plot(w/pi * (Fs / 2), 20 * log10(abs(h)));
% ax = gca;
% ax.XScale = 'log';
% ax.XLim = [0 10^5];
% ax.YLim = [-10 25];

theHiss = filter(bCoeff, aCoeff, noise);

theHiss = theHiss ./ max(abs(theHiss));

out = input + 0.08 * hiss_ratio * theHiss;

end