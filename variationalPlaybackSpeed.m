function output = variationalPlaybackSpeed(x, wow_factor, flutter_factor)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

p = zeros(length(x), 1);

%Generate Random Signal
f = generateNoise(wow_factor, 0.2, 1.3, length(x));
A = generateNoise(flutter_factor, 5, 5, length(x)) * 10e-04 ;

% subplot(3,1,1);
% t = linspace(0, length(x)/Fs, length(x));
% plot(t, f)
% xlim([0 6])
% ylim([0 2])

%Averaging to only allow transitions that are 20% of the pitch shift
% subplot(3,1,2);
% t = linspace(0, length(x)/Fs, length(x));
% plot(t, A)
% xlim([0 6])
% ylim([0 20*10e-4])

%Make Gaussian 
p = 1 + A(:) .* sin(2*pi*f(:)); 

% 
% subplot(3,1,3);
% t = linspace(0, length(x)/Fs, length(x));
% plot(t, p)
% xlim([0 6])
%ylim([0.99 1.02])

output = p .* x ;
end

