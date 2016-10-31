function rehashAll
% rehashAll tries to rehash the MATLAB paths.
%
%   rehashAll does this:
%
%     rehash toolboxreset
%     rehash pathreset
%     rehash toolboxcache

fprintf('rehash toolboxreset...\n');
rehash toolboxreset
fprintf('rehash pathreset...\n');
rehash pathreset
fprintf('rehash toolboxcache...\n');
rehash toolboxcache
