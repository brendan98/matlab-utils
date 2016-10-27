function editpriv(fcnName)
% EDITPRIV opens a private function in the editor.
%
%   EDITPRIV(FCNNAME) opens the private function FCNNAME in the MATLAB
%   editor.

fcnList = which(fcnName,'-all');
if isempty(fcnList)
    error('No result from: which(''%s'',''-all'')',fcnName);
end
edit(fcnList{1});
