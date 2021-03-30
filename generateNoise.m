function interpolated = generateNoise(wow_factor, variance, mean, length)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Create Noise
noise_pitch = randn(wow_factor, 1);
noise_pitch = noise_pitch / max(abs(noise_pitch)) * variance + mean;

% Interpolate Noise Fittingly
num_Noise = linspace(1, wow_factor, wow_factor);
num_Interpolation = linspace(1, wow_factor, length);
interpolated = spline(num_Noise, noise_pitch, num_Interpolation );

end

