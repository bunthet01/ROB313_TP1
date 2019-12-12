
% display the original images
img1 = double(imread('Amst-3.jpg'))/255;
f1 = figure;
figure(f1);
imagesc(img1)

img2 = double(imread('Amst-2.jpg'))/255;
f2 = figure;
figure(f2);
imagesc(img2)

% put the first image in bbox1
bbox1 = [-900 500 -50 450  ];
H1 = eye(3);
img_warped1 = vgg_warp_H(img1, H1, 'linear', bbox1);

%% display the first warped image
f3 = figure;
figure(f3);
imagesc(img_warped1)

% put the seconde image in bbox2

%% define Pt0 and PtD

% 4 windows version (more detailed)

% original points
X1 = [404 153 1];
X2 = [427 152 1];
X3 = [404 185 1];
X4 = [427 185  1];

% target points 
X1_prime = [23 151 1];
X2_prime = [47 151 1];
X3_prime = [23 184 1];
X4_prime = [47 184 1];

PtO = [X1' X2' X3' X4'];
PtD = [X1_prime' X2_prime' X3_prime' X4_prime'];
H2 = homography2d(PtO, PtD);
bbox2 = [-900 500 -50 450  ];
img_warped2 = vgg_warp_H(img2, H2, 'linear', bbox2);
%% display the first warped image
f4 = figure;
figure(f4);
imagesc(img_warped2)
% merge the two boxes 
im_fused = max(img_warped1,img_warped2);
f5 = figure;
figure(f5);
imagesc(im_fused)
