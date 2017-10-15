function y = sfbu2D_A(lo, hi, sf, d)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% This function is used in the level 1 reconstruction of CCWT to provide an undecimated filtering. 
% Modified from sfb2D_A.m by Yang Chen.


% 2D Synthesis Filter Bank
% (along single dimension only)
%
% y = sfb2D_A(lo, hi, sf, d);
% sf - synthesis filters
% d  - dimension of filtering
% see afb2D_A


lpf = sf(:, 1);     % lowpass filter
hpf = sf(:, 2);     % highpass filter

if d == 2
   lo = lo';
   hi = hi';
end

N = size(lo,1);
L = length(sf);
y = upfirdn(lo, lpf, 1, 1) + upfirdn(hi, hpf, 1, 1);
y(1:L-1, :) = y(1:L-1, :) + y(N+[1:L-1], :);
y = y(1:N, :)/2;
y = cshift2D(y, 1-L/2);

if d == 2
   y = y';
end

