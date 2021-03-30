beep off;

% Paper proposes: 
% Stereo-to-Mono || Maddie 
% Butterworth-Filter Low-Pass || Maddie 
% Clicks || Maddie 
% Thumps || Maddie 
% Hiss || Maddie 
% WoW || Silas 
% Lowpass Filter || Maddie 
% Tracking Errors || Silas

% Global Effects:
% 
%     Limit low-end (as storage limits it) - with Butterworth filters but chebyshef or Cauer may be better for real time || Maddie
%     Periodic Function that controls Playback Speed (0,1%-0,5% of playbackspeed) - 
%     Creation of time-warp function + Resampling of audiowaveform || Silas
%     Additive white noise (electrical circuit, ambient etc.) - Low-passed white noise (Page 124) || Maddie
% 
% Local Effects:
% 
%     Repeating a 1.8 seconds part of a song every once in a while (Tracking Errors) || Silas
%     Small impulses of 1ms - white-noise bursts with a alternating Butterworth filter // the clicks need to change in pitch! || Maddie
%     Thumps || Maddie
% 
% Questions: Distortion parallel or sequential? Is the Envelope Function Responsible for the Pitch Shift Strength and also random? 
% Do we want to spend time on the reproduction of clicks? With a reference signal and filtering the clicks etc (Page 125)
% 
% Possible ImprovementL Distortion effect with non-linear functions (method of playback) - Normalized Tanh function for clipping of loud signals, 
% signum with absolute of input for soft (Page 121)

[x, Fs] = audioread('harp.wav');

p = zeros(length(x), 1);

% Configuration 
wow_factor = 300;
flutter_factor = 400;

%Generate Random Signal
f = generateNoise(wow_factor, 0.2, 1.3, length(x));
A = generateNoise(flutter_factor, 5, 5, length(x)).' * 10e-04 ;

subplot(3,1,1);
t = linspace(0, length(x)/Fs, length(x));
plot(t, f)
xlim([0 6])
ylim([0 2])

%Averaging to only allow transitions that are 20% of the pitch shift
subplot(3,1,2);
t = linspace(0, length(x)/Fs, length(x));
plot(t, A)
xlim([0 6])
ylim([0 20*10e-4])

%Make Gaussian 
p = 1 + A(:) .* sin(2*pi*f(:)); 


subplot(3,1,3);
t = linspace(0, length(x)/Fs, length(x));
plot(t, p)
xlim([0 6])
%ylim([0.99 1.02])

test = p' * x ;
audiowrite('output.wav', test, Fs);

test = 1;





















