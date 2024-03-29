% Hohmann transfer for Big Bang rocket

% Values that are not final: v_init, alt_init

% Constants
my0   = 3.98601*1e5;  % Earth gravitational parameter [km^3/s^2]
Re    = 6378.137*1e3;     % Equatorial Earth's radius [m]
g     = 9.80665;      % Earth gravitational constant [m/s^2]

% Values from trajectory
v_init   = 7550;    % Initial velocity [m/s]
alt_init = 500000;  % Initial altitude [m]

% Values from rocket
mr  = 592;    % Mass of rocket excluding payload [kg]
m   = 500+mr; % Dry mass of upper stage [kg]
Isp = 317;    % Isp of the upper stage rocket
br  = 9.57;   % Burn rate [kg/s]

% Calculations
v_fin = sqrt(my0*1e9/(Re+alt_init)); % Final velocity [m/s] Equation given by 2.37 Wiesel p. 60
delta_v = v_fin - v_init; % Delta V required [m/s]
mp = m*(1-(1/exp((delta_v/(Isp*g))))); % Mass of propellant needed [kg] Equation given by 7.9 Wiesel p. 210
t_burn = mp/br; % Burn time for the Hohmann transfer [s] Equation given by 7.28 Wiesel p. 218

disp(['Values:' char(10) 'Delta V required: ' num2str(delta_v) ' m/s' char(10) 'Mass of propellant required: ' num2str(mp) ' kg' char(10) 'Burn time: ' num2str(t_burn) ' s'])
