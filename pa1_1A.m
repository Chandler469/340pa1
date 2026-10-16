% Vectorize the following
% Note the use of the tic/toc calls to time execution
% Compare the time once you have vectorized it

tic
% loop version
for i = 1:100000
    t(i) = 2*i;
    y(i) = sin(t(i));
end
toc
tic
% vectorized version
t = 1:1:100000;
y = 1:1:100000;
t = 2 * t;
y = sin(t);
toc
clear;

% After increasing both iteration count and vector size to stabilize the 
% timing results, it is observed that in general, the iteration version 
% takes on average 0.020000 seconds, and the vectorized version takes on
% average 0.001000 seconds, which is approximately 20 times faster. 