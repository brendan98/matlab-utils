function rehashAll
% rehashAll tries to rehash the MATLAB paths.
%
%   rehashAll does this:
%
%     rehash toolboxreset
%     rehash pathreset
%     rehash toolboxcache

fprintf('rehash toolboxreset...');
rehash toolboxreset
fprintf('rehash pathreset...');
rehash pathreset
fprintf('rehash toolboxcache...');
rehash toolboxcache
