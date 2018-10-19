% show the usage of LKTrackWrapper
clear
close all

%% image sequences
%{,
fn = '../data/castlejpg/castle.%03d.jpg';
% fn = 'data\\hotel\\hotel.seq%d.png';
imgNum = 27;
img = imread(sprintf(fn,0));
[M N C] = size(img);
imgseq = zeros(M,N,imgNum);
for p = 1:imgNum
	img1 = im2double(imread(sprintf(fn,p)));
	if C == 3, img1 = rgb2gray(img1); end
	imgseq(:,:,p) = img1;
end
LKTrackWrapper(imgseq);
%}

%% video
%{
obj = VideoReader('../data/medusa.dv');
vid = obj.read;
[M N C imgNum] = size(vid);
imgNum = min(imgNum,80);
imgseq = zeros(M,N,imgNum);
for p = 1:imgNum
	img1 = im2double(vid(:,:,:,p));
	if C == 3, img1 = rgb2gray(img1); end
	imgseq(:,:,p) = img1;
end

LKTrackWrapper(imgseq);
%}

