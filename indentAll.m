function indentAll(folderPath)
% Indent all matlab files in

if nargin < 1
    folderPath = pwd;
end

mFiles = dir(strcat(folderPath, filesep, '*.m'));

for n = 1 : length(mFiles)
    
    absoluteFilePath = fullfile(mFiles(n).folder, mFiles(n).name);
    editorObj = matlab.desktop.editor.openDocument(absoluteFilePath);
    editorObj.smartIndentContents();
    editorObj.save();
    editorObj.close;
    
end