function w1 = iCCWT2Ddir(w2)

% This function is used in CCWT.
% The algorithm of CCWT is described in the following paper:
% Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

% Inverse steps corresponding to CCWT2Ddir
% 
% USAGE:
%   w1 = iCCWT2Ddir(w2)
% INPUT:
%   w2 - wavelet coefficients
% OUTPUT:
%   w1 - wavelet coefficients


J=size(w2,2)-1;

w1{1}=w2{1};

for j=2:J
    
    z0=zeros(size(w2{j}{1}{1}));
    
    w1{j}{1}{1}=w2{j}{5}{1};
    w1{j}{2}{1}=w2{j}{5}{2};
    w1{j}{3}{1}=w2{j}{3}{1};
    w1{j}{4}{1}=w2{j}{3}{2};
    w1{j}{5}{1}=z0;
    w1{j}{6}{1}=z0;
    w1{j}{7}{1}=w2{j}{4}{1};
    w1{j}{8}{1}=w2{j}{4}{2};
    w1{j}{9}{1}=z0;
    
    w1{j}{1}{2}=w2{j}{7}{1};
    w1{j}{2}{2}=w2{j}{7}{2};
    w1{j}{3}{2}=w2{j}{1}{1};
    w1{j}{4}{2}=w2{j}{1}{2};
    w1{j}{5}{2}=w2{j}{8}{1};
    w1{j}{6}{2}=w2{j}{8}{2};
    w1{j}{7}{2}=z0;
    w1{j}{8}{2}=z0;
    w1{j}{9}{2}=z0;
    
    w1{j}{1}{3}=w2{j}{6}{1};
    w1{j}{2}{3}=w2{j}{6}{2};
    w1{j}{3}{3}=w2{j}{2}{1};
    w1{j}{4}{3}=w2{j}{2}{2};
    w1{j}{5}{3}=z0;
    w1{j}{6}{3}=z0;
    w1{j}{7}{3}=z0;
    w1{j}{8}{3}=z0;
    w1{j}{9}{3}=z0;
    
end

w1{J+1}=w2{J+1};


