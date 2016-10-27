function total_calories = calorieNeeds(sex,age,height,weight,act)
% CALORIENEEDS computes the amount of calories you burn daily
%
% [total_calories] = calorieNeeds(sex,age,height,weight,act) computes the
% amount of calories you need to consume daily to maintain your body weight
% based on several factors.  This is based on the formula for the Basal
% Metabolic Rate (BMR) from the Harris-Benedict equation found here:
%
% http://en.wikipedia.org/wiki/BMR
% 
% Inputs:
% sex.........string 'm' or 'f'
% age.........in years
% height......in inches
% weight......in pounds
% act.........activity level taken from this table:
%   1.2   = Sedentary (desk job, with little or no exercise)
%   1.375 = Lightly active (light exercise/sports 1-3 days/week)
%   1.55  = Moderately active (moderate exercise/sports 3-5 days/week)
%   1.725 = Very active (intensive exercise/sports 6-7 days/week)
%   1.9   = Extremely active (intensive daily exercise/sports & physical
%           job or twice per day training for marathon, races, fitness 
%           contests, etc.)

switch sex
    case 'm'
        bmrFun = @(weight,height,age) 66 + (13.7 * weight / 2.20462262) + ...
            (5 * height / 0.393700787) - (6.8 * age);
    case 'f'
        bmrFun = @(weight,height,age) 655 + (9.6 * weight / 2.20462262) + ...
            (1.8 * height / 0.393700787) - (4.7 * age);
end

total_calories = act * bmrFun(weight,height,age);
  