function Hd = butterworth(Fs, Fpass, Fstop, Apass, Astop)
%BUTTERWORTH1 Returns a discrete-time filter object.

% MATLAB Code
% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
% Fs = 44100;  % Sampling Frequency
% 
% Fpass = 9000;        % Passband Frequency
% Fstop = 12000;       % Stopband Frequency
% Apass = 0.45;        % Passband Ripple (dB)
% Astop = 13;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
