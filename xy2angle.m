function [deg, rad] = xy2angle(point)
% XY2ANGLE convert cartesian vector to angle.

% XY2ANGLE takes 2 element X-Y vector in cartesian coordinates and computes
% the angle the vector makes with 0 being north and going clockwise.

% Compute the angle, 0 is straight up, going clockwise
if point(2) == 0
    if point(1) > 0
        deg = pi / 2;
    else
        deg = 3 * pi / 2;
    end
else
    deg = atan(point(1)/point(2));
end

deg = deg / pi * 180;

if point(2) < 0
    deg = deg + 180;
elseif point(1) < 0 && point(2) > 0
    deg = deg + 360;
end

rad = deg2rad(deg);
