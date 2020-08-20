function savePrices(symbols,fname,APIKey,startDate)

b = barchart(APIKey);

if nargin < 4
    % Download as much history as we can
    startDate = datetime('19501231','InputFormat','yyyyMMdd');
end
endDate = datetime("today")-1;

% Merge each symbol into a single timetable
pricesTT = timetable;
for i = 1:numel(symbols)
    tickdata = history(b,symbols(i),startDate,endDate);
    Time = datetime(tickdata.tradingDay,'InputFormat','yyyy-MM-dd');
    closei = tickdata.close;
    tti = timetable(Time,closei,'VariableNames',symbols(i));
    pricesTT = synchronize(pricesTT,tti);
end

% Find earliest date where all symbols have data
validData = ~ismissing(pricesTT);
firstValidIndex = find(all(validData,2),1,'first');
pricesTT = pricesTT(firstValidIndex:end,:);

% Fill remaining missing data
pricesTT = fillmissing(pricesTT,'previous');

% Save data
save(fname,'pricesTT');
