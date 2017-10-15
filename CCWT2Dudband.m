function w1 = CCWT2Dudband(x, J, Faf, af)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% Decompose 2D array into nine DWT subbands then do the separation transform, using undecimated decomposition for the first level  
%
% USAGE:
%   w1 = CCWT2Dudband(x, J, Faf, af)
% INPUT:
%   x - 2-D array
%   J - number of stages
%   Faf{i}: first stage filters for tree i
%   af{i}:  filters for remaining stages on tree i
% OUTPUT:
%   w{j}{m}{n}{d} - wavelet coefficients
%       j = 1..J (scale)
%       m = 1,2,3 (phases 0, 2¦Ð/3, 4¦Ð/3  of the horizontal filter)
%       n = 1,2,3 (phases 0, 2¦Ð/3, 4¦Ð/3  of the vertical filter)
%       d = 1,2,3 (HL, LH, HH subbands)
%   w1{J+1}{m}{n} - lowpass coefficients
% EXAMPLE:
% w1{2}{1}{2}{3} - level 2, phase 0 horizontal filter, phase 2¦Ð/3 vertical filter, HH subband

% separation transform
% [u1 u2 u3 u4 u5 u6 u7 u8 u9]' = | 1 0 0 0 1 0 0 0 1 | * [w11 w12 w13 w21 w22 w23 w31 w32 w33]'    w11+w22+w33£¬w12+w23+w31£¬w13+w21+w32
%                                 | 0 1 0 0 0 1 1 0 0 |
%                                 | 1 0 0 0 0 1 0 1 0 |                                             w11+w23+w32£¬w12+w21+w33£¬w13+w22+w31
%                                 | 0 1 0 1 0 0 0 0 1 |
%                                 | 1 1 1 0 0 0 0 0 0 |                                             w11+w12+w13£¬w21+w22+w23£¬w31+w32+w33
%                                 | 0 0 0 1 1 1 0 0 0 |
%                                 | 1 0 0 1 0 0 1 0 0 |                                             w11+w21+w31£¬w12+w22+w32£¬w13+w23+w33
%                                 | 0 1 0 0 1 0 0 1 0 |
%                                 | 1 1 1 1 1 1 1 1 1 |                                             w11+w12+w13+w21+w22+w23+w31+w32+w33=0

%corresponding inverse transform matrix
%|  1  0  1  0  1  0  1  0 -1 | * 1/3
%|  0  1  0  1  1  0  0  1 -1 |
%| -1 -1 -1 -1  1  0 -1 -1  2 |
%| -1 -1  0  1  0  1  1  0  0 |
%|  1  0 -1 -1  0  1  0  1  0 |
%|  0  1  1  0  0  1 -1 -1  0 |
%|  0  1 -1 -1 -1 -1  1  0  1 |
%| -1 -1  1  0 -1 -1  0  1  1 |
%|  1  0  0  1 -1 -1 -1 -1  1 |




x = x/3;

for m = 1:3
    for n = 1:3
        [lo w{1}{m}{n}] = afbu2D(x, Faf{m}, Faf{n});
        for j = 2:J
            [lo w{j}{m}{n}] = afb2D(lo, af{m}, af{n});
        end
        w{J+1}{m}{n} = lo;
    end
end

% keep the first level unchanged. because this level is with a doubled phase (see paper), hence do not have the same properties as other levels 
for m = 1:3
    w1{1}{1}{m}=w{1}{1}{1}{m};
    w1{1}{2}{m}=w{1}{1}{2}{m};
    w1{1}{3}{m}=w{1}{1}{3}{m};
    w1{1}{4}{m}=w{1}{2}{1}{m};
    w1{1}{5}{m}=w{1}{2}{2}{m};
    w1{1}{6}{m}=w{1}{2}{3}{m};
    w1{1}{7}{m}=w{1}{3}{1}{m};
    w1{1}{8}{m}=w{1}{3}{2}{m};
    w1{1}{9}{m}=w{1}{3}{3}{m};
end

for j = 2:J
    for m = 1:3
        w1{j}{1}{m}=w{j}{1}{1}{m}+w{j}{2}{2}{m}+w{j}{3}{3}{m};
        w1{j}{2}{m}=w{j}{1}{2}{m}+w{j}{2}{3}{m}+w{j}{3}{1}{m};
        w1{j}{3}{m}=w{j}{1}{1}{m}+w{j}{2}{3}{m}+w{j}{3}{2}{m};
        w1{j}{4}{m}=w{j}{1}{2}{m}+w{j}{2}{1}{m}+w{j}{3}{3}{m};
        w1{j}{5}{m}=w{j}{1}{1}{m}+w{j}{1}{2}{m}+w{j}{1}{3}{m};
        w1{j}{6}{m}=w{j}{2}{1}{m}+w{j}{2}{2}{m}+w{j}{2}{3}{m};
        w1{j}{7}{m}=w{j}{1}{1}{m}+w{j}{2}{1}{m}+w{j}{3}{1}{m};
        w1{j}{8}{m}=w{j}{1}{2}{m}+w{j}{2}{2}{m}+w{j}{3}{2}{m};
        w1{j}{9}{m}=w{j}{1}{1}{m}+w{j}{1}{2}{m}+w{j}{1}{3}{m}+w{j}{2}{1}{m}+w{j}{2}{2}{m}+w{j}{2}{3}{m}+w{j}{3}{1}{m}+w{j}{3}{2}{m}+w{j}{3}{3}{m};
    end
end

% keep the scale level unchanged
w1{J+1}=w{J+1};

