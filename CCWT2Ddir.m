function w2 = CCWT2Ddir(w1)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% Extracting 8 directional subbands from the decomposition results of CCWT2Dband or CCWT2Dudband
% Single channel CCWT = single 2D channel -> CCWT2Dband -> CCWT2Ddir
% Undecimated single channel CCWT = single 2D channel -> CCWT2Dudband -> CCWT2Ddir
% 
% USAGE:
%   w2 = CCWT2Ddir(w1)
% INPUT:
%   w1 - wavelet coefficients
% OUTPUT:
%   w2{j}{n}{p} - wavelet coefficients
%       j = 1..J (scale)
%       n = 1,2,...,8 (orientations of n¦Ð/8, 1 ~ 8 represent for ¦Ð/8 ~ ¦Ð)
%       p = 1,2,3 (phases 0, 2¦Ð/3, 4¦Ð/3)


J=size(w1,2)-1;

w2{1}=w1{1};

for j=2:J
%     w1{j}{9}{1}=0;w1{j}{9}{2}=0;w1{j}{9}{3}=0;
    w2{j}{1}{1}=w1{j}{3}{2};w2{j}{1}{2}=w1{j}{4}{2};w2{j}{1}{3}=w1{j}{9}{2}-w1{j}{3}{2}-w1{j}{4}{2};   %¦Ð/8
    w2{j}{2}{1}=w1{j}{3}{3};w2{j}{2}{2}=w1{j}{4}{3};w2{j}{2}{3}=w1{j}{9}{3}-w1{j}{3}{3}-w1{j}{4}{3};   %¦Ð/4
    w2{j}{3}{1}=w1{j}{3}{1};w2{j}{3}{2}=w1{j}{4}{1};w2{j}{3}{3}=w1{j}{9}{1}-w1{j}{3}{1}-w1{j}{4}{1};   %3¦Ð/8
    w2{j}{4}{1}=w1{j}{7}{1};w2{j}{4}{2}=w1{j}{8}{1};w2{j}{4}{3}=w1{j}{9}{1}-w1{j}{7}{1}-w1{j}{8}{1};   %¦Ð/2
    w2{j}{5}{1}=w1{j}{1}{1};w2{j}{5}{2}=w1{j}{2}{1};w2{j}{5}{3}=w1{j}{9}{1}-w1{j}{1}{1}-w1{j}{2}{1};   %5¦Ð/8
    w2{j}{6}{1}=w1{j}{1}{3};w2{j}{6}{2}=w1{j}{2}{3};w2{j}{6}{3}=w1{j}{9}{3}-w1{j}{1}{3}-w1{j}{2}{3};   %3¦Ð/4
    w2{j}{7}{1}=w1{j}{1}{2};w2{j}{7}{2}=w1{j}{2}{2};w2{j}{7}{3}=w1{j}{9}{2}-w1{j}{1}{2}-w1{j}{2}{2};   %7¦Ð/8
    w2{j}{8}{1}=w1{j}{5}{2};w2{j}{8}{2}=w1{j}{6}{2};w2{j}{8}{3}=w1{j}{9}{2}-w1{j}{5}{2}-w1{j}{6}{2};   %0
end

w2{J+1}=w1{J+1};


