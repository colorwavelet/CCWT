function [lo, hi] = afbu2D_A(x, af, d)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% This function is used in the level 1 decomposition of CCWT to provide an undecimated filtering. 
% Modified from afb2D_A.m by Yang Chen.


% 2D Analysis Filter Bank
% (along one dimension only)
%
% [lo, hi] = afb2D_A(x, af, d);
% INPUT:
%    x - NxM matrix, where min(N,M) > 2*length(filter)
%           (N, M are even)
%    af - analysis filter for the columns
%    af(:, 1) - lowpass filter
%    af(:, 2) - highpass filter
%    d - dimension of filtering (d = 1 or 2)
% OUTPUT:
%     lo, hi - lowpass, highpass subbands
%
% % Example
% x = rand(32,64);
% [af, sf] = farras;
% [lo, hi] = afb2D_A(x, af, 1);
% y = sfb2D_A(lo, hi, sf, 1);
% err = x - y;
% max(max(abs(err)))

lpf = af(:, 1);     % lowpass filter
hpf = af(:, 2);     % highpass filter

if d == 2
   x = x';
end

N = size(x,1);
L = size(af,1);
x = cshift2D(x,-L/2);

lo = upfirdn(x, lpf, 1, 1);
lo(1:L-1, :) = lo(1:L-1, :) + lo([1:L-1]+N, :);
lo = lo(1:N, :);

hi = upfirdn(x, hpf, 1, 1);
hi(1:L-1, :) = hi(1:L-1, :) + hi([1:L-1]+N, :);
hi = hi(1:N, :);

if d == 2
   lo = lo';
   hi = hi';
end


