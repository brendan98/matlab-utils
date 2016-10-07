function ccd (input_arg)
% I is in ur codebais, makin commentz.
% CCD keeps a stack of directories you can cd to easily.
%
%   "Cool" Change Directory
%   ---------------------
%   Usage:
%
%   ccd <target directory>
%      - cd's to the target directory and then adds it to the stack
%
%   ccd ?
%      - lists the directory stack (with index numbers shown)
%
%   ccd <integer value>
%      - changes directory to the specified directory in the stack
%
%   ccd clear
%      - clears the directory stack
%
%   ccd pop
%      - removes the top entry from the stack, and then cd's to that dir
%
%   ccd [with no arguements]
%      - toggles through the directories in a cycle.
%
%   HINT: add a few ccd calls in your startup.m file to "seed" it with some
%       commonly used directories if you like.
%   HINT: to use tabbed-autocompletion, just use the normal "cd" command
%       and then at the very end hit <HOME> + <c> to prepend the final
%       command with a "c" (to make it "cool").
%   HINT: To add the current directory to the stack, just use "ccd ."

% basic input checking
narginchk(0,1);

% load ccddata or else initialize variables
fname = fullfile(prefdir,'ccddata.mat');
if isequal(exist(fname,'file'),2)
    load(fname);
else
    dirStack = {};
    pointer = 0;
end
stackSize = numel(dirStack);

if nargin == 0

    % No arguments, toggle through the directories (top down)
    if stackSize > 0
        pointer = pointer - 1;
        if pointer < 1
            pointer = stackSize;
        end
        target = dirStack{pointer};
        goToDir(target);
        saveStack(dirStack,pointer);
        disp(pwd);
    else
        fprintf('CCD: directory stack is empty\n');
    end
    
elseif ~isnan(str2double(input_arg))

    % Input argument is numeric
    index = round(str2double(input_arg));
    if index > stackSize
        fprintf('CCD: invalid stack index, current stack size is %d.\n',...
            numel(dirStack));
    elseif index < 1
        error('CCD stack index must be positive');
    else
        % Valid stack index
        target = dirStack{index};
        goToDir(target);
        pointer = index;
        saveStack(dirStack,pointer);
    end

elseif ischar(input_arg)

    % Input argument is a string
    if strcmp(input_arg,'?')
        % Print the stack
        printStack(dirStack,pointer);

    elseif strcmpi(input_arg,'pop')

        % Pop the stack
        if stackSize < 1
            % Stack is already empty
            printStack(dirStack,pointer);
        else
            % Pop the top dir off the stack
            dirStack = dirStack(1:end-1);
            stackSize = numel(dirStack);
            if pointer > stackSize
                pointer = stackSize;
            end
            printStack(dirStack,pointer);
            saveStack(dirStack,pointer);
        end

    elseif strcmpi(input_arg, 'clear')

        % Delete the stack
        dirStack = {};
        pointer = 0;
        saveStack(dirStack,pointer)

    else

        % Verify they passed a legit directory
        if ~isdir(input_arg)
            error('CCD: invalid directory: %s.',input_arg);
        end
        
        % Save current dir and then cd to a new directory
        goToDir(input_arg);
        currentDir = pwd;
        if ~ismember(currentDir,dirStack)
            dirStack{end+1} = currentDir;
        end
        saveStack(dirStack,pointer)
    end
    
else
    
    % Input_arg is neither numeric or string
    error('CCD: invalid input argument to CCD.');
end


function printStack(dirStack,pointer)
% Prints the stack to the command window

stackSize = numel(dirStack);
fprintf(' \n');
fprintf('CCD: Current Directory Stack\n');
fprintf('----------------------------\n');
if stackSize < 1
    fprintf('    <empty stack>\n');
else
    for i = stackSize:-1:1
        if isequal(i,pointer)
            fprintf('->%d : %s\n',i,rootPath(dirStack{i},'[root]'));
        else
            fprintf('  %d : %s\n',i,rootPath(dirStack{i},'[root]'));
        end
    end
end


function goToDir(target_dir)
% Goes to target dir and also prints it to the command window

cd(target_dir);
fprintf('%s\n',strrep(target_dir,matlabroot,'[root]'));


function saveStack(dirStack,pointer) %#ok<INUSD>
% Save the stack to the prefdir

save(fullfile(prefdir,'ccddata.mat'),'dirStack','pointer');


