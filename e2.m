% Sample script  that shows how to automate running problem solutions
close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Load an image using the imread command 
img = imread("peppers3.tif");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b) Display original image in the first spot of a 2 x 3 a grid layout
%    Check the imshow and subplot commands.
subplot(2, 3, 1);
imshow(img)
title("Original peppers image")
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c) Display a gray scale version of the image in position 2 of the grid.
%    help rgb2gray
gray_img = rgb2gray(img);
subplot(2, 3, 2);
imshow(gray_img)
title("Grayscale peppers image")
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d) Generate a new figure and ask user to manually select a region of the
%    image. Display the subimage in position 3 of the grid.
%    Hint 1: getrect()
%    Hint 2: to use getrect, you should first install Image Processing Toolbox:
%         (a) Open the Add-On Manager in MATLAB via "Home > Add-Ons > Get Add-Ons" and install the Add-On Explorer if it is not already installed.
%         (b) Search "Image Processing Toolbox" and install it.
%         (c) Restart MATLAB after installing

% Get user input on a newly displayed image

% Make grid the current figure

% Display selected region. Make sure to apply the cut
% over all 3 channels.

% You are NOT ALLOWED to use the imcrop function of Matlab.
imshow(img)
title("Click and drag to select an area:")
rect = getrect;
x = round(rect(1));
y = round(rect(2));
width = round(rect(3));
height = round(rect(4));
roi = img(y: y + height, x: x + width, :);
subplot(2, 3, 3);
imshow(roi)
title("Selected region")
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e) Create a function J = luminance_change(I, option, value) such that:
%   * When given the option 'c', the contrast of image I's top-left and 
%     bottom-right quadrants will be modified by the given value.
%     Simple multiplication will achieve this.
%   * When given the option 'b', the brightness of image I's top-right and 
%     bottom-left quadrants will be modified by the given value.
%     Simple addition will achieve this.
%  
%   Showcase your function by filling positions 4 and 5 in the grid

function J = luminance_change(I, option, value)
    [height, width, channel] = size(I);
    mid_height = round(height/2);
    mid_width = round(width/2);
    I = im2double(I);
    if option == 'c'
        top_left = value * (I(1: mid_height, 1: mid_width, :) - 127.5) + 127.5;
        top_left = min(max(top_left, 0), 255.0);
        bottom_right = value * (I(mid_height: height, mid_width: width, :) - 127.5) + 127.5;
        bottom_right = min(max(bottom_right, 0), 255.0);
        I(mid_height: height, mid_width: width, :) = top_left;
        I(mid_height: height, mid_width: width, :) = bottom_right;
    elseif option == 'b'
        top_right = min(I(1: mid_height, mid_width: width, :) * (1 + value), 1);
        bottom_left = min(I(mid_height: height, 1: mid_width, :) * (1 + value), 1);
        I(1: mid_height, mid_width: width, :) = top_right;
        I(mid_height: height, 1: mid_width, :) = bottom_left;
    end
    J = I;
end

% Contrast change
contrast_change_img = luminance_change(img, 'c', 0.2);
subplot(2, 3, 4);
imshow(contrast_change_img);
title("Reduced contrast")
pause();

% Brightness change
brightness_change_img = luminance_change(img, 'b', 0.2);
subplot(2, 3, 5);
imshow(brightness_change_img);
title("Increased brightness")
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f) [Extra question for curiosity, no points]: 
% Display a version of the image after it's been blurred using a
% Gaussian filter. Hint: imgaussfilt()
