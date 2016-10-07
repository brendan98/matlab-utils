function fun = createCleanAnon(fun,isHG,useObj,useEvt,varargin)
% createCleanAnon creates a function handle with clean workspace.
%
%   CREATECLEANANON will create a function handle with an empty workspace.
%   This function is an alternative creating an anonymous function directly
%   in the workspace, which will "snapshot" all the variables in the
%   workspace.  This can potentially cause reference count issues if the
%   function handle will live longer than the workspace, which can happen
%   when creating callback functions (for example).
%
%   Inputs
%   ======
%   fun : The function to execute (a function handle)
%   isHG : If set to true then the resulting function handle will take 2
%          arguments (the object and the event data) and can be used as an
%          callback to the MATLAB graphics system
%   useObj : If set to true, the function, fun, will take the HG object as
%            the first input argument.
%   useEvt : If set to true, the function, fun, will take both the HG
%            object and event data as its first 2 input arguments.
%   varargin : The remaining arguments to the function, fun.

if isHG
    
    if useObj && useEvt
        fun = @(obj,evt) fun(obj,evt,varargin{:});
    elseif useObj
        fun = @(obj,evt) fun(obj,varargin{:});
    elseif useEvt
        fun = @(obj,evt) fun(evt,varargin{:});
    else
        fun = @(obj,evt) fun(varargin{:});
    end
    
else
    
    fun = @() fun(varargin{:});
    
end
