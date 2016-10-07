% CC tries to clear out everything in the MATLAB session
%
% It does this:
% =============
% clc
% try %#ok<TRYNC>
%     dbquit
% end
% fclose all;
% close all hidden
% close all force
% clear
% clear variables
% clear global
% clear mex
% clear classes

clc
try %#ok<TRYNC>
    dbquit
end
fclose all;
close all hidden
close all force
clear
clear variables
clear global
clear mex
clear classes


