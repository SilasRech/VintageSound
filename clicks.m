function out = clicks(input, fs)

mu = -3.6267;
sigma = 0.7421;

a1 = 10.6907;
b1 = 1.0606;
a2 = 0.2;
b2 = 2433.8;

click_vec = rand(length(input), 1);
click_vec(click_vec > 0.9995) = 1; 

click_vec = floor(click_vec);
click = zeros(length(click_vec), 1);

duration = makedist('Weibull','a',a1,'b',b1);
%timeDifference = makedist('Weibull','a',a2,'b',b2);
amplitudeClick = makedist('LogNormal','mu',mu,'sigma',sigma);

timbre = makedist('Uniform','Lower',0.1*(fs/2),'Upper',0.5*(fs/2));

% 
for k=1:length(click_vec)
    if click_vec(k) == 1
        y1 = random(duration);
        click(k:k+round(y1)-1) = random(amplitudeClick) * ones(round(y1), 1);
    end
end

for k=1:10000:length(click_vec)-10000
    random_cutoff = random(timbre);
    click(k:k+10000) = lowpass(click(k:k+10000),random_cutoff, fs);
end

out = input + 0.65 * (click(1:length(input)) / max(abs(click)));

