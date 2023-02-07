% Sampling rate and cutoff frequencies
Fs = 7000;
Fpass1 = 1400;
Fpass2 = 2100;
Fstop1 = 1050;
Fstop2 = 2450;

% Pass band ripple and minimum stop band attenuation
Rp = 0.4;
Rs = 50;

% Design Butterworth filter
[n,Wn] = buttord([Fpass1 Fpass2]/(Fs/2), [Fstop1 Fstop2]/(Fs/2), Rp, Rs);
b_butter = butter(n,Wn);
a_butter = 1;

% Design Chebyshev Type I filter
[n,Wn] = cheb1ord([Fpass1 Fpass2]/(Fs/2), [Fstop1 Fstop2]/(Fs/2), Rp, Rs);
b_cheby1 = cheby1(n,Rp,Wn);
a_cheby1 = 1;

% Design Chebyshev Type II filter
[n,Wn] = cheb2ord([Fpass1 Fpass2]/(Fs/2), [Fstop1 Fstop2]/(Fs/2), Rp, Rs);
b_cheby2 = cheby2(n,Rs,Wn);
a_cheby2 = 1;

% Design Elliptic filter
[n,Wn] = ellipord([Fpass1 Fpass2]/(Fs/2), [Fstop1 Fstop2]/(Fs/2), Rp, Rs);
b_ellip = ellip(n,Rp,Rs,Wn);
a_ellip = 1;

% Plot frequency response of Butterworth filter
figure;
freqz(b_butter,a_butter);
title('Butterworth Filter Frequency Response');

% Plot frequency response of Chebyshev Type I filter
figure;
freqz(b_cheby1,a_cheby1);
title('Chebyshev Type I Filter Frequency Response');

% Plot frequency response of Chebyshev Type II filter
figure;
freqz(b_cheby2,a_cheby2);
title('Chebyshev Type II Filter Frequency Response');

% Plot frequency response of Elliptic filter
figure;
freqz(b_ellip,a_ellip);
title('Elliptic Filter Frequency Response');
