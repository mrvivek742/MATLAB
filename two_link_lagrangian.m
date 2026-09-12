% =====================================
% 2-LINK ROBOT LAGRANGIAN ANALYSIS
% L = T - V
% =====================================

% =====================================
% ROBOT PARAMETERS
% =====================================

% Link lengths
l1 = 1;
l2 = 0.8;

% Link masses
m1 = 2;
m2 = 1.5;

% Center of mass distances
lc1 = l1 / 2;
lc2 = l2 / 2;

% Moment of inertia of links
I1 = (1/12) * m1 * l1^2;
I2 = (1/12) * m2 * l2^2;

% Gravity
g = 9.81;

% =====================================
% JOINT ANGLES
% =====================================

theta1 = 45 * pi / 180;
theta2 = 30 * pi / 180;

% Joint velocities
theta1_dot = 0.5;
theta2_dot = 0.3;

% =====================================
% CENTER OF MASS POSITION
% =====================================

% Link 1 Center of Mass
x_c1 = lc1 * cos(theta1);
y_c1 = lc1 * sin(theta1);

% Link 2 Center of Mass
x_c2 = l1*cos(theta1) + ...
       lc2*cos(theta1 + theta2);

y_c2 = l1*sin(theta1) + ...
       lc2*sin(theta1 + theta2);

% =====================================
% CENTER OF MASS VELOCITIES
% =====================================

% Link 1 velocity
vx_c1 = -lc1*sin(theta1) * theta1_dot;

vy_c1 = lc1*cos(theta1) * theta1_dot;


% Link 2 velocity
vx_c2 = -l1*sin(theta1)*theta1_dot ...
        -lc2*sin(theta1 + theta2) ...
        *(theta1_dot + theta2_dot);

vy_c2 = l1*cos(theta1)*theta1_dot ...
        +lc2*cos(theta1 + theta2) ...
        *(theta1_dot + theta2_dot);

% =====================================
% KINETIC ENERGY
% =====================================

% Translational kinetic energy
T1_trans = 0.5 * m1 * ...
    (vx_c1^2 + vy_c1^2);

T2_trans = 0.5 * m2 * ...
    (vx_c2^2 + vy_c2^2);

% Rotational kinetic energy
T1_rot = 0.5 * I1 * theta1_dot^2;

T2_rot = 0.5 * I2 * ...
    (theta1_dot + theta2_dot)^2;

% Total Kinetic Energy
T = T1_trans + T1_rot + ...
    T2_trans + T2_rot;

% =====================================
% POTENTIAL ENERGY
% =====================================

V1 = m1 * g * y_c1;

V2 = m2 * g * y_c2;

V = V1 + V2;

% =====================================
% LAGRANGIAN
% =====================================

L = T - V;

% =====================================
% DISPLAY RESULTS
% =====================================

disp('================================');
disp('LAGRANGIAN DYNAMICS RESULTS');
disp('================================');

fprintf('\nKinetic Energy:\n');
fprintf('T = %.4f Joules\n', T);

fprintf('\nPotential Energy:\n');
fprintf('V = %.4f Joules\n', V);

fprintf('\nLagrangian:\n');
fprintf('L = T - V = %.4f\n', L);

% =====================================
% ROBOT POSITION
% =====================================

x0 = 0;
y0 = 0;

x1 = l1*cos(theta1);
y1 = l1*sin(theta1);

x2 = x1 + l2*cos(theta1 + theta2);
y2 = y1 + l2*sin(theta1 + theta2);

% =====================================
% DRAW ROBOT
% =====================================

figure;

% Draw links
plot([x0 x1 x2], ...
     [y0 y1 y2], ...
     '-o', ...
     'LineWidth', 4, ...
     'MarkerSize', 10);

hold on;

% Draw Center of Mass Link 1
plot(x_c1, y_c1, 's', ...
    'MarkerSize', 10, ...
    'LineWidth', 2);

% Draw Center of Mass Link 2
plot(x_c2, y_c2, 's', ...
    'MarkerSize', 10, ...
    'LineWidth', 2);

grid on;
axis equal;

xlim([-2 2]);
ylim([-2 2]);

xlabel('X Position');
ylabel('Y Position');

title('2-Link Robot - Lagrangian Dynamics');

legend('Robot', ...
       'Link 1 Center of Mass', ...
       'Link 2 Center of Mass');

hold off;
