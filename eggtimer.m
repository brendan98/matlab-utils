function eggtimer(time_in_minutes,msg)
% Eggtimer causes a dialog box alert after some minutes.
%
%   EGGTIMER(MINUTES) opens an alert dialog box after MINUTES minutes.
%
%   EGGTIMER(MINUTES,MSG) opens an alert dialog box after MINUTES minutes
%   with message MSG.

if nargin < 2
    msg = '';
end

t = timer('ExecutionMode','singleshot',...
    'StartDelay',time_in_minutes * 60,...
    'TimerFcn',{@eggtimer_cb,msg});

start(t);

function eggtimer_cb(obj,evt,msg) %#ok<INUSL>

beep;
warndlg(msg,'Egg Timer');
stop(obj);
delete(obj);
