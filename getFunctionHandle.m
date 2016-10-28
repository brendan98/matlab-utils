function fun = getFunctionHandle(fcnPath)
% getFunctionHandle gets function handle for function not on the path.

%   getFunctionHandle(fcnPath) takes a matlab function and it's absolute
%   path and returns a function handle to that function.  It is useful for
%   getting function handles to functions that are not on the path (such as
%   in private folders).

% Break out the path and file name
[path,fname,~] = fileparts(fcnPath);

% Go grab the function handle
origDir = pwd;
cu = onCleanup(@() cd(origDir));
cd(path);
fun = str2func(fname);

% Return to the original directory
clear cu;
