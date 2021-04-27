
function interpolated = generateNoise(wow_factor, variance, mean, length)
% Function to implement periodic pitch variation effect based on random
% numbers. Creates a random vector that is spline interpolated depending on the
% fluctation speed.

% Create Noise with specified variance and mean while
noise_pitch = randn(wow_factor, 1);
noise_pitch = noise_pitch / max(abs(noise_pitch)) * variance + mean;

% Spline Interpolate Noise for Smoothing and Variation
num_Noise = linspace(1, wow_factor, wow_factor);
num_Interpolation = linspace(1, wow_factor, length);
interpolated = spline(num_Noise, noise_pitch, num_Interpolation );

end

