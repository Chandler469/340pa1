% Vectorize the following
% Note the use of the tic/toc calls to time execution
% Compare the time once you have vectorized it

tic
% loop version
for i = 1:1000
    t(i) = 2*i;
    y(i) = sin (t(i));
end
toc

% vectorized version
t = 1:1:1000;
y = 1:1:1000;
t = 2 * t;
y = sin(t);

clear;

% After executing ... who am i kidding.