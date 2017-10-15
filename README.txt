CCWT demo

This folder contains the MATLAB code for demonstrating the complementary color wavelet transform (CCWT).

The algorithm is described in the following paper:

Yang Chen, Dan Li, and Jian Qiu Zhang, "Complementary Color Wavelet: A Novel Tool for Color Image/Video Analyses and Processing", 2017.

For further information, please contact: 13110720040@fudan.edu.cn

==========
v1.0  2017.10.15


* List of files

    all the files are tested on Matlab R2011b

Examples

    example1, example2  - CCWT analysis/synthesis demonstration
    (more examples will be available soon)


Images

    1.bmp, 2.bmp    - 512*512 color images for demostrating CCWT, these images are from the following paper
                        J. Van de Weijer, T. Gevers, and A. D. Bagdanov, ¡°Boosting color
                        saliency in image feature detection,¡± Pattern Analysis and Machine
                        Intelligence, IEEE Transactions on, vol. 28, no. 1, pp. 150¨C156, 2006.


Filterbanks of 2¦Ð/3 relative phases, length 22 with Thiran allpass filter L1=5, L2=5 and vanishing moment VM=1

    CCWTFB0551      - CCWT filterbanks
    FsCCWTFB0551    - CCWT filterbanks for the First stage
    FsCCWTFB0551ud  - CCWT filterbanks for the First stage, undecimated


DWT related functions, these functions are mainly from or modified from Selesnick's work, http://taco.poly.edu/WaveletSoftware/

    afb2D.m     - 2D Analysis Filter Bank
    afb2D_A.m   - 2D Analysis Filter Bank (along single dimension only)
    sfb2D.m     - 2D Synthesis Filter Bank
    sfb2D_A.m   - 2D Synthesis Filter Bank (along single dimension only)

    (The followings are the corresponding undecimated version)
    afbu2D.m
    afbu2D_A.m
    sfbu2D.m
    sfbu2D_A.m


2D single channel CCWT

    CCWT2Dband      - Decompose 2D array into nine DWT subbands then do the separation transform
    iCCWT2Dband     - Inverse transform of CCWT2Dband

    CCWT2Dudband    - undecimated version of CCWT2Dband
    iCCWT2Dudband   - undecimated version of CCWT2Dudband

    CCWT2Ddir       - Extracting directional subbands from the decomposition results of CCWT2Dband or CCWT2Dudband
    iCCWT2Ddir      - undecimated version of CCWT2Ddir


2D multi-channel CCWT

    CCWT2Dcolor     - Extracting color information from the results of CCWT2Ddir
    iCCWT2Dcolor    - Inverse transform of CCWT2Dcolor


