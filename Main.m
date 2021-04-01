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

% Configuration 
wow_factor = 300;
flutter_factor = 400;

[x_mono, Fs] = audioread('harp.wav');

%x_mono = stereo2mono(x);

filtered_x1 = filterSection1(x_mono);

variation_speed = variationalPlaybackSpeed(filtered_x1, wow_factor, flutter_factor);

filtered_x2 = filterSection2(variation_speed);

output = trackError(filtered_x2, Fs);

output = output / max(abs(output));
audiowrite('output.wav', output, Fs);





















