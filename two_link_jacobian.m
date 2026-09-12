% =====================================
% 2-LINK ROBOT JACOBIAN
% VELOCITY KINEMATICS
% =====================================

% Link Lengths
l1 = 1;
l2 = 0.8;

% Joint Angles
theta1 = 45 * pi / 180;
theta2 = 30 * pi / 180;

% Joint Velocities (rad/s)
theta1_dot = 0.5;
theta2_dot = 0.3;

% =====================================
% JACOBIAN MATRIX
% =====================================

J11 = -l1*sin(theta1) ...
      -l2*sin(theta1 + theta2);

J12 = -l2*sin(theta1 + theta2);

J21 = l1*cos(theta1) ...
      +l2*cos(theta1 + theta2);

J22 = l2*cos(theta1 + theta2);

% Jacobian Matrix
J = [J11 J12;
     J21 J22];

% =====================================
% JOINT VELOCITY VECTOR
% =====================================

q_dot = [theta1_dot;
         theta2_dot];

% =====================================
% END EFFECTOR VELOCITY
% =====================================

end_effector_velocity = J * q_dot;

x_dot = end_effector_velocity(1);
y_dot = end_effector_velocity(2);

% =====================================
% DISPLAY RESULTS
% =====================================

disp('================================');
disp('JACOBIAN MATRIX');
disp('================================');

disp(J);

fprintf('\nJoint Velocities:\n');
fprintf('Theta1_dot = %.3f rad/s\n', theta1_dot);
fprintf('Theta2_dot = %.3f rad/s\n', theta2_dot);

fprintf('\nEnd Effector Velocity:\n');
fprintf('X_dot = %.3f units/s\n', x_dot);
fprintf('Y_dot = %.3f units/s\n', y_dot);

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

plot([x0 x1 x2], ...
     [y0 y1 y2], ...
     '-o', ...
     'LineWidth', 4, ...
     'MarkerSize', 10);

hold on;

% =====================================
% DRAW VELOCITY VECTOR
% =====================================

quiver(x2, y2, ...
       x_dot, y_dot, ...
       0.5, ...
       'LineWidth', 2);

grid on;
axis equal;

xlim([-2 2]);
ylim([-2 2]);

xlabel('X Position');
ylabel('Y Position');

title('2-Link Robot - Jacobian and End Effector Velocity');

legend('Robot', 'End Effector Velocity');

hold off;
