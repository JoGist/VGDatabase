model Test
    parameter Real a = -1.0;
    Real x(start = 1.0);
equation
    der(x) = a * x;
end Test;
