% input_image = mean(double(imread('../data/castlejpg/castle.008.jpg'))/255,3);
% input_mask = all(input_image > 0,3);
% output = SIRFS(input_image, input_mask, [], '');
% %%
% input_image = double(imread('../data/castlejpg/castle.008.jpg'))/255;
% input_mask = all(input_image > 0,3);
% output = SIRFS(input_image, input_mask, [], '');
%%
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
p = 50;
input_image = double(imgseq(:,:,p));
input_mask = all(input_image > 0,3);
output = SIRFS(input_image, input_mask, [], '');