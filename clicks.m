function out = clicks(input, fs, clicks_ratio)

% Adds clicks on an input signal, based on the provided probability
% distribution in https://www.researchgate.net/publication/287114601_
% Digital_audio_antiquing_-_Signal_processing_methods_for_imitating_the_sound_quality_of_historical_recordings

% Parameters
mu = -3.6267;
sigma = 0.7421;

a1 = 10.6907;
b1 = 1.0606;
a2 = 0.2;
b2 = 2433.8;

click_vec = rand(length(input), 1);
click_vec(click_vec > 0.9992) = 1; 

click_vec = floor(click_vec);
click = zeros(length(click_vec), 1);

% Distribution for Duration, Amplitude and Pitch
duration = makedist('Weibull','a',a1,'b',b1);
amplitudeClick = makedist('LogNormal','mu',mu,'sigma',sigma);
timbre = makedist('Uniform','Lower',0.1*(fs/2),'Upper',0.5*(fs/2));

% Create click vector dependent on amplitude and duration
for k=1:length(click_vec)
    if click_vec(k) == 1
        y1 = random(duration);
        click(k:k+round(y1)-1) = random(amplitudeClick) * ones(round(y1), 1);
    end
end

% Lowpass signal with random cutoff based on timbre uniform distribution
for k=1:1000:length(click_vec)-1000
    random_cutoff = random(timbre);
    click(k:k+1000) = lowpass(click(k:k+1000),random_cutoff, fs);
end

out = input + clicks_ratio * (click(1:length(input)) / max(abs(click)));