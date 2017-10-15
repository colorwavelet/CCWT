function y = iCCWT2Dudband(w1, J, Fsf, sf)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% Inverse (Reconstruction) steps corresponding to CCWT2Dudband, using undecimated decomposition for the first level
% 
% USAGE:
%   y = iCCWT2Dudband(w1, J, Fsf, sf)
% INPUT:
%   w1 - wavelet coefficients
%   J - number of stages
%   Fsf - synthesis filters for final stage
%   sf - synthesis filters for preceeding stages
% OUTPUT:
%   y - output array

% inverse separation transform
% [w11 w12 w13 w21 w22 w23 w31 w32 w33]' = |  1  0  1  0  1  0  1  0 -1 | * [u1 u2 u3 u4 u5 u6 u7 u8 u9]' /3
%                                          |  0  1  0  1  1  0  0  1 -1 |
%                                          | -1 -1 -1 -1  1  0 -1 -1  2 |
%                                          | -1 -1  0  1  0  1  1  0  0 |
%                                          |  1  0 -1 -1  0  1  0  1  0 |
%                                          |  0  1  1  0  0  1 -1 -1  0 |
%                                          |  0  1 -1 -1 -1 -1  1  0  1 |
%                                          | -1 -1  1  0 -1 -1  0  1  1 |
%                                          |  1  0  0  1 -1 -1 -1 -1  1 |



% keep the first level unchanged. because this level is with a doubled phase (see paper), hence do not have the same properties as other levels 
for m = 1:3
    w{1}{1}{1}{m}=w1{1}{1}{m};
    w{1}{1}{2}{m}=w1{1}{2}{m};
    w{1}{1}{3}{m}=w1{1}{3}{m};
    w{1}{2}{1}{m}=w1{1}{4}{m};
    w{1}{2}{2}{m}=w1{1}{5}{m};
    w{1}{2}{3}{m}=w1{1}{6}{m};
    w{1}{3}{1}{m}=w1{1}{7}{m};
    w{1}{3}{2}{m}=w1{1}{8}{m};
    w{1}{3}{3}{m}=w1{1}{9}{m};
end


for j = 2:J
    for m = 1:3
        w{j}{1}{1}{m} = (w1{j}{1}{m}+w1{j}{3}{m}+w1{j}{5}{m}+w1{j}{7}{m}-w1{j}{9}{m})/3;
        w{j}{1}{2}{m} = (w1{j}{2}{m}+w1{j}{4}{m}+w1{j}{5}{m}+w1{j}{8}{m}-w1{j}{9}{m})/3;
        w{j}{1}{3}{m} = (-w1{j}{1}{m}-w1{j}{2}{m}-w1{j}{3}{m}-w1{j}{4}{m}+w1{j}{5}{m}-w1{j}{7}{m}-w1{j}{8}{m}+2*w1{j}{9}{m})/3;
        w{j}{2}{1}{m} = (-w1{j}{1}{m}-w1{j}{2}{m}+w1{j}{4}{m}+w1{j}{6}{m}+w1{j}{7}{m})/3;
        w{j}{2}{2}{m} = (w1{j}{1}{m}-w1{j}{3}{m}-w1{j}{4}{m}+w1{j}{6}{m}+w1{j}{8}{m})/3;
        w{j}{2}{3}{m} = (w1{j}{2}{m}+w1{j}{3}{m}+w1{j}{6}{m}-w1{j}{7}{m}-w1{j}{8}{m})/3;
        w{j}{3}{1}{m} = (w1{j}{2}{m}-w1{j}{3}{m}-w1{j}{4}{m}-w1{j}{5}{m}-w1{j}{6}{m}+w1{j}{7}{m}+w1{j}{9}{m})/3;
        w{j}{3}{2}{m} = (-w1{j}{1}{m}-w1{j}{2}{m}+w1{j}{3}{m}-w1{j}{5}{m}-w1{j}{6}{m}+w1{j}{8}{m}+w1{j}{9}{m})/3;
        w{j}{3}{3}{m} = (w1{j}{1}{m}+w1{j}{4}{m}-w1{j}{5}{m}-w1{j}{6}{m}-w1{j}{7}{m}-w1{j}{8}{m}+w1{j}{9}{m})/3;
    end
end

% keep the scale level unchanged
w{J+1}=w1{J+1};


y = zeros(size(w{1}{1}{1}{1}));
for m = 1:3
    for n = 1:3
        lo = w{J+1}{m}{n};
        for j = J:-1:2
            lo = sfb2D(lo, w{j}{m}{n}, sf{m}, sf{n});
        end
        lo = sfbu2D(lo, w{1}{m}{n}, Fsf{m}, Fsf{n});
        y = y + lo;
    end
end

% normalization
y = y/3;

