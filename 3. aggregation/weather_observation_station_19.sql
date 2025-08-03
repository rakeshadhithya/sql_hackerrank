-- Topic: FORMAT, SQRT, POWER, MIN, MAX
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true
-- same table just find min(a), max(b) of LAT_N and min(c), max(d) of LONG_W and use sqrt((a-c)^2 + (b-d)^2) easy but tricky, 
-- they said P1(a,c) not P1(a,b), P2(b,d) not P2(c,d) but given (a,b) is min and max of lat_n and (c,d) is min and max of long_w

SELECT FORMAT(
        SQRT( 
            POWER( MIN(LAT_N) - MAX(LAT_N), 2) +
            POWER( MIN(LONG_W) - MAX(LONG_W), 2) 
        )
        , 4 )
FROM STATION