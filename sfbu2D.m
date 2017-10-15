function y = sfbu2D(lo, hi, sf1, sf2)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% This function is used in the level 1 reconstruction of CCWT to provide an undecimated filtering. 
% Modified from sfb2D.m by Yang Chen.


% 2D Synthesis Filter Bank
%
% USAGE:
%   y = sfb2D(lo, hi, sf1, sf2);
% INPUT:
%   lo, hi - lowpass, highpass subbands
%   sf1 - synthesis filters for the columns
%   sf2 - synthesis filters for the rows
% OUTPUT:
%   y - output array
% See afb2D
%
% WAVELET SOFTWARE AT POLYTECHNIC UNIVERSITY, BROOKLYN, NY
% http://taco.poly.edu/WaveletSoftware/


if nargin < 4
    sf2 = sf1;
end

% filter along rows
lo = sfbu2D_A(lo,    hi{1}, sf2, 2);    % Modified
hi = sfbu2D_A(hi{2}, hi{3}, sf2, 2);    % Modified

% filter along columns
y = sfbu2D_A(lo, hi, sf1, 1);   % Modified


