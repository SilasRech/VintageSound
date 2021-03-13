# VintageSound


Roadmap for writing a VinylLP Plug-In in Matlab

Combination of Global and Local Effects added on a recording.

# I suggest we implement these with parameter control in a cascade manner
# What would be a good order of filter here that comes close to the physical?

Paper proposes:
Stereo-to-Mono
Butterworth-Filter (Low-Pass or Bandpass)
TanH Function for Clipping / signum for soft-clipping


Butterworth-Filter (Lowpass)


Global Effects:

1. Convolution with frequency response of old speaker setup  - Program here is HornResp or AJ-Horn for Frequency Response Page 119)
2. Bandpass to limit low and high frequencies (as storage limits it) - with two different Butterworth filters but chebyshef or Cauer may be better for real time, one with low-cut / bandpass and one at the end always with low-pass 
3. Distortion effect with non-linear functions (method of playback) - Normalized Tanh function for clipping of loud signals, signum with absolute of input for soft (Page 121)
4. Periodic Function that controls Playback Speed (0,1%-0,5% of playbackspeed) - Creation of time-warp function + Resampling of audiowaveform -
5. Additive white noise (electrical circuit, ambient etc.) - Low-passed white noise (Page 124)
6. Limit to limit dynamic range to 70dB (for slight clipping of the tracks) - Covered in Point 3

Local Effects:

1. Repeating a 1.8 seconds part of a song every once in a while (Tracking Errors)
2. Small impulses of 1ms - white-noise bursts with a alternating Butterworth filter // the clicks need to change in pitch!
3. Adding a two part consisting of click with expontentially decaying oscillation



Questions:
Distortion parallel or sequential?
Is the Envelope Function Responsible for the Pitch Shift Strength and also random?
Do we want to spend time on the reproduction of clicks? With a reference signal and filtering the clicks etc (Page 125)

