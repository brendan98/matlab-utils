function ret = findAvgReturn(dates,contributions,balance)
% FINDAVGRETURN Find average rate of return for contributions
%
% FINDAVGRETURN computes the constant rate of return that a 401k (for
% example) would have required to produce the current balance.  It answers
% the question "How has my 401k done?"
%
% DATES and CONTRIBUTIONS are the contribution data from your provider from
% the start of the account.  DATES are matlab date numbers.  BALANCE is the
% current account balance.

t = (today - dates) / 365.25;
fun = @(ret) sum(contributions .* exp(ret * t)) - balance;

ret = lsqnonlin(fun,0.05);
