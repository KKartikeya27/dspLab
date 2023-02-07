clear;
clc;

% Sampling rate
fs = 12e3;

% Pass band edge frequencies
wp = [2.1e3, 4.5e3] / (fs/2);

% Stop band edge frequencies
ws = [2.7e3, 3.9e3] / (fs/2);

% Pass band ripple
Rp = 0.6;

% Minimum stop band attenuation
Rs = 45;

% Design Butterworth filter
[n, Wn] = buttord(wp, ws, Rp, Rs);
[b,a] = butter(n, Wn, 'stop');

% Plot Butterworth filter response
figure;
[h, w] = freqz(b, a, 1024);
plot(w/(2*pi)*fs, 20*log10(abs(h)), 'LineWidth', 2);
grid on;
xlim([0 fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Butterworth Filter Response');

% Design Chebyshev Type I filter
[n, Wn] = cheb1ord(wp, ws, Rp, Rs);
[b,a] = cheby1(n, Rp, Wn, 'stop');

% Plot Chebyshev Type I filter response
figure;
[h, w] = freqz(b, a, 1024);
plot(w/(2*pi)*fs, 20*log10(abs(h)), 'LineWidth', 2);
grid on;
xlim([0 fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Chebyshev Type I Filter Response');

% Design Chebyshev Type II filter
[n, Wn] = cheb2ord(wp, ws, Rp, Rs);
[b,a] = cheby2(n, Rs, Wn, 'stop');

% Plot Chebyshev Type II filter response
figure;
[h, w] = freqz(b, a, 1024);
plot(w/(2*pi)*fs, 20*log10(abs(h)), 'LineWidth', 2);
grid on;
xlim([0 fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Chebyshev Type II Filter Response');

% Design Elliptic filter
[n, Wn] = ellipord(wp, ws, Rp, Rs);
[b,a] = ellip(n, Rp, Rs, Wn, 'stop');

% Plot Elliptic filter response
figure;
[h, w] = freqz(b, a, 1024);
plot(w/(2*pi)*fs, 20*log10(abs(h)), 'LineWidth', 2);
grid on;
xlim([0 fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Elliptic Filter Response');
