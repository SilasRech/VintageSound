# VintageSound


Roadmap for writing a VinylLP Plug-In in Matlab

Combination of Global and Local Effects added on a recording.

# I suggest we implement these with parameter control in a cascade manner
# What would be a good order of filter here that comes close to the physical?

Paper proposes:
Stereo-to-Mono || Maddie
Butterworth-Filter Low-Pass || Maddie
Clicks || Maddie
Thumps || Maddie
Hiss || Maddie
WoW || Silas
Lowpass Filter || Maddie
Tracking Errors || Silas

Global Effects:

1. Limit low-end (as storage limits it) - with Butterworth filters but chebyshef or Cauer may be better for real time || Maddie || DONE
2. Periodic Function that controls Playback Speed (0,1%-0,5% of playbackspeed) - Creation of time-warp function + Resampling of audiowaveform || Silas || DONE
3. Additive white noise (electrical circuit, ambient etc.) - Low-passed white noise (Page 124) || Maddie

Local Effects:

1. Repeating a 1.8 seconds part of a song every once in a while (Tracking Errors) || Silas || DONE
2. Small impulses of 1ms - white-noise bursts with a alternating Butterworth filter // the clicks need to change in pitch! || Maddie
3. Thumps || Maddie

Questions:
Distortion parallel or sequential?
Is the Envelope Function Responsible for the Pitch Shift Strength and also random?
Do we want to spend time on the reproduction of clicks? With a reference signal and filtering the clicks etc (Page 125)

Possible ImprovementL Distortion effect with non-linear functions (method of playback) - Normalized Tanh function for clipping of loud signals, signum with absolute of input for soft (Page 121)

