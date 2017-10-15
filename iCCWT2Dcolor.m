function [ wR, wG, wB ] = iCCWT2Dcolor( oR, oG, oB, oW )

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% Inverse steps corresponding to CCWT2Dcolor
% 
% USAGE:
%   [ wR, wG, wB ] = iCCWT2Dcolor( oR, oG, oB, oW )
% INPUT:
%   oR, oG, oB, oW - 2D complementary color transform/operator
% OUTPUT:
%   wR, wG, wB - wavelet coefficients


J=size(oR,2)-1;

wR{1}=oR{1};
wG{1}=oG{1};
wB{1}=oB{1};

for j = 2:J
    for dir=1:8
        wR{j}{dir}{1}=(-oR{j}{dir}{1}+oG{j}{dir}{1}+oB{j}{dir}{1}+oW{j}{dir}{1})/4;
        wG{j}{dir}{2}=(oR{j}{dir}{1}-oG{j}{dir}{1}+oB{j}{dir}{1}+oW{j}{dir}{1})/4;
        wB{j}{dir}{3}=(oR{j}{dir}{1}+oG{j}{dir}{1}-oB{j}{dir}{1}+oW{j}{dir}{1})/4;
        
        wR{j}{dir}{2}=(-oR{j}{dir}{2}+oG{j}{dir}{2}+oB{j}{dir}{2}+oW{j}{dir}{2})/4;
        wG{j}{dir}{3}=(oR{j}{dir}{2}-oG{j}{dir}{2}+oB{j}{dir}{2}+oW{j}{dir}{2})/4;
        wB{j}{dir}{1}=(oR{j}{dir}{2}+oG{j}{dir}{2}-oB{j}{dir}{2}+oW{j}{dir}{2})/4;
        
        wR{j}{dir}{3}=(-oR{j}{dir}{3}+oG{j}{dir}{3}+oB{j}{dir}{3}+oW{j}{dir}{3})/4;
        wG{j}{dir}{1}=(oR{j}{dir}{3}-oG{j}{dir}{3}+oB{j}{dir}{3}+oW{j}{dir}{3})/4;
        wB{j}{dir}{2}=(oR{j}{dir}{3}+oG{j}{dir}{3}-oB{j}{dir}{3}+oW{j}{dir}{3})/4;
    end
end

wR{J+1}=oR{J+1};
wG{J+1}=oG{J+1};
wB{J+1}=oB{J+1};

