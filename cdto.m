function cdto (target)
% CDTO change to directory containing file.
%
%   CDTO(TARGET) changes directory to the folder on the MATLAB path
%   containing the file TARGET.
%
%   If the target is omitted, then CDTO will use the active file in the
%   MATLAB editor as the target.

try
    
    if nargin < 1
        % Target is current active file in editor
        targetFile = matlab.desktop.editor.getActiveFilename;
    else
        allTargets = which(target,'-all');
        targetFile = allTargets{1};
    end
    [targetDir,~] = fileparts(targetFile);
    cd(targetDir);
    fprintf('%s\n',strrep(pwd,matlabroot,'[root]'));
    
catch e %#ok<NASGU>
    
    disp('cdto: Unable to find target directory');
    
end
