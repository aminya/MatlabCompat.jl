% Janus is a minimalistic model image
% analysis script aimed
% to work in Julia and MATLAB without
% changing its syntax
%
% Copyright � Vardan Andriasyan, Yauhen Yakimovich, Artur Yakimovich 2015
% MIT license.
%
% Permission is hereby granted, free of charge, to any person
% obtaining a copy of this software and associated documentation files (the
% "Software"), to deal in the Software without restriction, including without
% limitation the rights to use, copy, modify, merge, publish, distribute,
% sublicense, and/or sell copies of the Software, and to permit persons to whom
% the Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% read the remote images
imgTreated = imread('http://matlabcompat.github.io/img/example_Treated.tif');
imgNonTreated = imread('http://matlabcompat.github.io/img/example_NonTreated.tif');
 
threshold = graythresh(imgNonTreated); % compute grayscale threshold of the non treated image using Otsu algorithm
 
% create a binary image based on the grayscale images
imgBWTreated = im2bw(imgTreated, threshold);
imgBWNonTreated = im2bw(imgNonTreated, threshold);

% count foreground pixels for each image and output it in console
foregroundPixelCountTreated = sum(reshape(imgBWTreated, 1,numel(imgBWTreated)));
foregroundPixelCountNonTreated =  sum(reshape(imgBWNonTreated, 1,numel(imgBWNonTreated)));
display(strcat('Foreground pixel count for Treated specimen: ',num2str(foregroundPixelCountTreated)))
display(strcat('Foreground pixel count for Non-Treated specimen: ',num2str(foregroundPixelCountNonTreated)))

