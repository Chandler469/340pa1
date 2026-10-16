img = imread("peppers3.tif");
imshow(img)
title("Click and drag to select an area:")
rect = getrect; 

x_start = round(rect(1));
y_start = round(rect(2));
width   = round(rect(3));
height  = round(rect(4));

x_end = x_start + width;
y_end = y_start + height;

% 4. Crop the region of interest (Rows = Y, Columns = X)
cropped_img = img(y_start:y_end, x_start:x_end, :);

% 5. Show results
figure;
imshow(cropped_img);