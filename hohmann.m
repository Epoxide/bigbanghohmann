% Hohmann transfer for Big Bang rocket

% Values that are not final: phi_init, v_init, alt_init, lat, mr, Isp, T

% Constants
my0   = 3.98601*1e5;  % Earth gravitational parameter [km^3/s^2]
Re    = 6378.137;     % Equatorial Earth's radius [km]
Rp    = 6356.7523;    % Polar Earth's radius [km]
g     = 9.80665;      % Earth gravitational constant [m/s^2]

% Values from trajectory
phi_init = 0; % Initial Angle [degrees]
v_init   = 0; % Initial velocity [m/s]
alt_init = 500000; % Initial altitude [m]
lat   = 59.3496;      % Geographical latitude under rocket at apogee [degrees]

% Values from rocket
mr  = 0; % Mass of rocket excluding payload [kg]
m   = 500+mr; % Dry mass of upper stage [kg]
Isp = 1000; % Isp of the upper stage rocket
T   = 0 ; % Thrust [N]

% Calculations
r_loc = sqrt(((Re^2*cosd(lat))^2+(Rp^2*sind(lat))^2)/((Re*cosd(lat))^2+(Rp*sind(lat))^2))*1e3; % Earth's radius under the rocket at apogee [m]
v_fin = sqrt(my0*1e9/(r_loc+alt_init)); % Final velocity [m/s] Equation given by 2.37 Wiesel p. 60
delta_v = v_fin - v_init; % Delta V required [m/s]
mp = m*(1-1/exp((delta_v/(Isp*g)))); % Mass of propellant needed [kg] Equation given by 7.9 Wiesel p. 210
t_burn = T/(Isp*g)*mp; % Burn time for the Hohmann transfer [s] Equation given by 7.28 Wiesel p. 218

disp(['Values:' char(10) 'Delta V required: ' num2str(delta_v) 'm/s' char(10) 'Mass of propellant required: ' num2str(mp) 'kg' char(10) 'Burn time: ' num2str(t_burn) 's'])
