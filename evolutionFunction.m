function dy = evolutionFunction(t,y,m1,m2,k1,k2)

dy = zeros(size(y));

dy(1) = y(2);
dy(2) = ( -(k1+k2) * y(1) + k2 * y(3) ) / m1;
dy(3) = y(4);
dy(4) = ( k1 * y(1) - k2 * y(3) ) / m2;