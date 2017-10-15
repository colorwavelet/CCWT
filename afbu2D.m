function [lo, hi] = afbu2D(x, af1, af2)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% This function is used in the level 1 decomposition of CCWT to provide an undecimated filtering. 
% Modified from afb2D.m by Yang Chen.


% 2D Analysis Filter Bank
%
% USAGE:
%   [lo, hi] = afb2D(x, af1, af2);
% INPUT:
%   x - N by M matrix
%       1) M, N are both even
%       2) M >= 2*length(af1)
%       3) N >= 2*length(af2)
%   af1 - analysis filters for columns
%   af2 - analysis filters for rows
% OUTPUT:
%    lo - lowpass subband
%    hi{1} - 'lohi' subband
%    hi{2} - 'hilo' subband
%    hi{3} - 'hihi' subband
% EXAMPLE:
%   x = rand(32,64);
%   [af, sf] = farras;
%   [lo, hi] = afb2D(x, af, af);
%   y = sfb2D(lo, hi, sf, sf);
%   err = x - y;
%   max(max(abs(err)))
%
% WAVELET SOFTWARE AT POLYTECHNIC UNIVERSITY, BROOKLYN, NY
% http://taco.poly.edu/WaveletSoftware/

if nargin < 3
   af2 = af1;
end

% filter along columns
[L, H] = afbu2D_A(x, af1, 1);   %Modified

% filter along rows
[lo,    hi{1}] = afbu2D_A(L, af2, 2);   %Modified
[hi{2}, hi{3}] = afbu2D_A(H, af2, 2);   %Modified

