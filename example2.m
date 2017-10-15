% example2 of CCWT
% undecimated decomposition for the first level
% the sizes of the decomposition results are double, but have a higher resolution

I1=imread('2.bmp');

I1R=double(I1(:,:,1));
I1G=double(I1(:,:,2));
I1B=double(I1(:,:,3));


J = 5;
[Faf, Fsf] = FsCCWTFB0551ud;
[af, sf] = CCWTFB0551;


w1r = CCWT2Dudband(I1R, J, Faf, af);
wR = CCWT2Ddir(w1r);

w1g = CCWT2Dudband(I1G, J, Faf, af);
wG = CCWT2Ddir(w1g);

w1b = CCWT2Dudband(I1B, J, Faf, af);
wB = CCWT2Ddir(w1b);

[ oR, oG, oB, oW ] = CCWT2Dcolor( wR, wG, wB );


%energy sum of 8 subbands of Chroma operator
%for shift invariance, three initial phases (see paper and CCWT2Dcolor.m) are taken into account together.
figure;imagesc((abs(oW{2}{1}{1}).^2+abs(oW{2}{1}{2}).^2+abs(oW{2}{1}{3}).^2)+(abs(oW{2}{2}{1}).^2+abs(oW{2}{2}{2}).^2+abs(oW{2}{2}{3}).^2)+(abs(oW{2}{3}{1}).^2+abs(oW{2}{3}{2}).^2+abs(oW{2}{3}{3}).^2)+...
    (abs(oW{2}{4}{1}).^2+abs(oW{2}{4}{2}).^2+abs(oW{2}{4}{3}).^2)+(abs(oW{2}{5}{1}).^2+abs(oW{2}{5}{2}).^2+abs(oW{2}{5}{3}).^2)+(abs(oW{2}{6}{1}).^2+abs(oW{2}{6}{2}).^2+abs(oW{2}{6}{3}).^2)+...
    (abs(oW{2}{7}{1}).^2+abs(oW{2}{7}{2}).^2+abs(oW{2}{7}{3}).^2)+(abs(oW{2}{8}{1}).^2+abs(oW{2}{8}{2}).^2+abs(oW{2}{8}{3}).^2));colormap(gray(128))
set (gcf,'Position',[200,200,512,512]);set(gca,'Position',[0 0 1 1]);


%energy sum of 8 subbands of Red-Cyan operator
figure;imagesc((abs(oR{2}{1}{1}).^2+abs(oR{2}{1}{2}).^2+abs(oR{2}{1}{3}).^2)+(abs(oR{2}{2}{1}).^2+abs(oR{2}{2}{2}).^2+abs(oR{2}{2}{3}).^2)+(abs(oR{2}{3}{1}).^2+abs(oR{2}{3}{2}).^2+abs(oR{2}{3}{3}).^2)+...
    (abs(oR{2}{4}{1}).^2+abs(oR{2}{4}{2}).^2+abs(oR{2}{4}{3}).^2)+(abs(oR{2}{5}{1}).^2+abs(oR{2}{5}{2}).^2+abs(oR{2}{5}{3}).^2)+(abs(oR{2}{6}{1}).^2+abs(oR{2}{6}{2}).^2+abs(oR{2}{6}{3}).^2)+...
    (abs(oR{2}{7}{1}).^2+abs(oR{2}{7}{2}).^2+abs(oR{2}{7}{3}).^2)+(abs(oR{2}{8}{1}).^2+abs(oR{2}{8}{2}).^2+abs(oR{2}{8}{3}).^2));colormap(gray(128))
set (gcf,'Position',[200,200,512,512]);set(gca,'Position',[0 0 1 1]);


%¦Ð/4 Chroma operator
figure;imagesc(oW{4}{2}{1}.^2+oW{4}{2}{2}.^2+oW{4}{2}{3}.^2);colormap(gray(128))
set (gcf,'Position',[200,200,512,512]);set(gca,'Position',[0 0 1 1]);


%3¦Ð/4 Chroma operator
figure;imagesc(oW{4}{6}{1}.^2+oW{4}{6}{2}.^2+oW{4}{6}{3}.^2);colormap(gray(128))
set (gcf,'Position',[200,200,512,512]);set(gca,'Position',[0 0 1 1]);

%% inverse transform and errors
% the errors are from the design error of the filterbanks
[ wR1, wG1, wB1 ] = iCCWT2Dcolor( oR, oG, oB, oW );

w2r = iCCWT2Ddir(wR1);
w2g = iCCWT2Ddir(wG1);
w2b = iCCWT2Ddir(wB1);

I2R = iCCWT2Dudband(w2r, J, Fsf, sf);
I2G = iCCWT2Dudband(w2g, J, Fsf, sf);
I2B = iCCWT2Dudband(w2b, J, Fsf, sf);

meanerrR=mean(mean(abs(I1R-I2R)));
meanerrG=mean(mean(abs(I1G-I2G)));
meanerrB=mean(mean(abs(I1B-I2B)));

maxerrR=max(max(abs(I1R-I2R)));
maxerrG=max(max(abs(I1G-I2G)));
maxerrB=max(max(abs(I1B-I2B)));

