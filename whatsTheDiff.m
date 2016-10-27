function maxDiff = whatsTheDiff(A,B,tol)
% WHATSTHEDIFF compares 2 numeric matrices
%
%   maxDiff = whatsTheDiff(A,B,tol) reports statistics on the differences
%   between the 2 matrices A and B.  tol is an optional 3rd arg to specify
%   the tolerance.  If tol is not specified it defaults to 1e8 * eps.
%   

if isequal(A,B)
    fprintf('The two inputs are equal.\n');
    return
end

% use default tolerance if non provided
if nargin < 3
    tol = 1e8 * eps;
end

% convert them to vectors
A = A(:);
B = B(:);

% compute various values
maxDiff = max(abs(A-B));
diffArray = abs(A-B);
failureArray = diffArray(diffArray > tol);
numDiff = numel(failureArray);
meanFailureDiff = mean(failureArray);

% display values
fprintf(sprintf('number of values                   : %d\n',numel(A)));
fprintf(sprintf('number of values outside tolerance : %d\n',numDiff));
fprintf(sprintf('maximum tolerance                  : %.10f\n',tol));
fprintf(sprintf('maximum difference                 : %.10f\n',maxDiff));
fprintf(sprintf('average failure difference         : %.10f\n',meanFailureDiff));
fprintf('\n');

fprintf('Max Difference : %e\n\n',maxDiff);
