beep off;
% Pipeline Structure: 
% Stereo-to-Mono
% Butterworth-Filter Low-Pass 
% Clicks 
% Thumps  
% Hiss 
% WoW 
% Lowpass Filter 
% Tracking Errors 

% Global Effects:
% 
%     1. Limit low-end (as storage limits it) - with Butterworth filters but chebyshef or Cauer may be better for real time 
%     2. Periodic Function that controls Playback Speed (0,1%-0,5% of playbackspeed) - 
%     Creation of time-warp function + Resampling of audiowaveform
%     3. Additive white noise (electrical circuit, ambient etc.) - Low-passed white noise  
% 
% Local Effects:
% 
%     4. Tracking Erros Repeating a 1.8 seconds part of a song every once in a while 
%     5. Clicks Small impulses of 1ms - white-noise bursts with a alternating Butterworth filter 
%     6. Thumps 
% 

% Configuration 

% Strength of perceived variation
variation_ratio = 3;

% Strength and occurrence of clicks in new recording
clicks_ratio = 0.9;

% Percentage of amplitude hiss added into recording
hiss_ratio = 0.6;

% Percentage of amplitude of thump in recording
thumps_ratio = 1.1;

wow_factor = round(300*variation_ratio);
flutter_factor = round(400* variation_ratio);

% Read in File
[x, Fs] = audioread('harp.wav');
%% Mono and lowpass filtering
x_mono = stereo2mono(x);

filtered_x1 = filterSection1(x_mono, Fs, "LP");
%% Clicks
xClicks = clicks(x_mono, Fs, clicks_ratio);
%% Thumps
audioWithThumps = thumps(xClicks, Fs, thumps_ratio);
%% Hiss
xHiss = hiss(audioWithThumps, Fs, hiss_ratio);
%% Wow and flutter
variation_speed = variationalPlaybackSpeed(xHiss, wow_factor, flutter_factor);
%% Lowpass
filtered_x2 = filterSection2(variation_speed, Fs, "LP");
%% Tracking Error
output = trackError(filtered_x2, Fs);
%%
output = output / max(abs(output));

audiowrite('HarpOutBad.wav', output, Fs);





















