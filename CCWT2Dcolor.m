function [ oR, oG, oB, oW ] = CCWT2Dcolor( wR, wG, wB )

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% Extracting color information from the results of CCWT2Ddir 
% Multi-channel CCWT = 2D RGB channels -> CCWT2Dband -> CCWT2Ddir -> CCWT2Dcolor
% Undecimated multi-channel CCWT = 2D RGB channels -> CCWT2Dudband -> CCWT2Ddir -> CCWT2Dcolor
%
% USAGE:
%   [ oR, oG, oB, oW ] = CCWT2Dcolor( wR, wG, wB )
% INPUT:
%   wR, wG, wB - wavelet coefficients from CCWT2Ddir for RGB channels
% OUTPUT:
%   oR, oG, oB, oW - 2D complementary color transform/operator
%   oR{j}{dir}{p}
%       j = 1..J (scale)
%       dir = 1,2,...,8 (orientations of n¦Ð/8, 1 ~ 8 represent for ¦Ð/8 ~ ¦Ð)
%       p = 1,2,3 (initial phase (¦È0), see paper, 0, 2¦Ð/3, 4¦Ð/3)

% transform
% T = |-1  1  1|
%     | 1 -1  1|
%     | 1  1 -1|
%     | 1  1  1|

% [Rd1 Gd1 Bd1 Wd1]' = T * [R1 G2 B3]'
% [Rd2 Gd2 Bd2 Wd2]' = T * [R2 G3 B1]'
% [Rd3 Gd3 Bd3 Wd3]' = T * [R3 G1 B2]'


% inverse transform£¬pseudo-inverse Tp=pinv(T)
% Tp = 1/4 * |-1  1  1  1|
%            | 1 -1  1  1|
%            | 1  1 -1  1|

% [R1 G2 B3]' = Tp * [Rd1 Gd1 Bd1 Wd1]'
% [R2 G3 B1]' = Tp * [Rd2 Gd2 Bd2 Wd2]'
% [R3 G1 B2]' = Tp * [Rd3 Gd3 Bd3 Wd3]'


J=size(wR,2)-1;

oR{1}=wR{1};
oG{1}=wG{1};
oB{1}=wB{1};
oW{1}=[];

for j = 2:J
    for dir=1:8
        oR{j}{dir}{1}=(-wR{j}{dir}{1}+wG{j}{dir}{2}+wB{j}{dir}{3});oR{j}{dir}{2}=(-wR{j}{dir}{2}+wG{j}{dir}{3}+wB{j}{dir}{1});oR{j}{dir}{3}=(-wR{j}{dir}{3}+wG{j}{dir}{1}+wB{j}{dir}{2});
        oG{j}{dir}{1}=(wR{j}{dir}{1}-wG{j}{dir}{2}+wB{j}{dir}{3});oG{j}{dir}{2}=(wR{j}{dir}{2}-wG{j}{dir}{3}+wB{j}{dir}{1});oG{j}{dir}{3}=(wR{j}{dir}{3}-wG{j}{dir}{1}+wB{j}{dir}{2});
        oB{j}{dir}{1}=(wR{j}{dir}{1}+wG{j}{dir}{2}-wB{j}{dir}{3});oB{j}{dir}{2}=(wR{j}{dir}{2}+wG{j}{dir}{3}-wB{j}{dir}{1});oB{j}{dir}{3}=(wR{j}{dir}{3}+wG{j}{dir}{1}-wB{j}{dir}{2});
        oW{j}{dir}{1}=(wR{j}{dir}{1}+wG{j}{dir}{2}+wB{j}{dir}{3});oW{j}{dir}{2}=(wR{j}{dir}{2}+wG{j}{dir}{3}+wB{j}{dir}{1});oW{j}{dir}{3}=(wR{j}{dir}{3}+wG{j}{dir}{1}+wB{j}{dir}{2});
    end
end

oR{J+1}=wR{J+1};
oG{J+1}=wG{J+1};
oB{J+1}=wB{J+1};
oW{J+1}=[];

