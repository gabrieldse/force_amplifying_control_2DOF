function plot_prismatic_robot(positions, xo, r)
    % ANIMATE_PRISMATIC_ROBOT - Animate a 2D 2DOF prismatic robot.
    % Inputs:
    %   positions - Nx2 matrix where each row is [x, y] position of the end-effector.
    %   xo - Position of the obstacle as [x; y].
    %   r - Radius of the obstacle.

    % Obstacle position
    obs_x = xo(1);
    obs_y = xo(2);

    % Define maximum reach limits
    max_x = 1; % 1 meter range in x
    max_y = 1; % 1 meter range in y

    % Create figure for animation
    figure;
    
    for i = 1:size(positions, 1)
        % Get current end-effector position
        x = positions(i, 1);
        y = positions(i, 2);

        % Define joint positions
        base = [0, 0]; % Base of the robot
        joint1 = [x, 0]; % First prismatic joint moves along x-axis
        end_effector = [x, y]; % Second prismatic joint moves along y-axis to reach (x, y)

        % Clear previous plot
        clf;
        hold on;

        % Blue line: From base (0, 0) to joint1 (x, 0)
        plot([base(1), joint1(1)], [base(2), joint1(2)], 'b-', 'LineWidth', 2); 

        % Red line: From joint1 (x, 0) to end-effector (x, y)
        plot([joint1(1), end_effector(1)], [joint1(2), end_effector(2)], 'r-', 'LineWidth', 2); 

        % Plot the end-effector position
        plot(end_effector(1), end_effector(2), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);

        % Plot the obstacle
        theta = linspace(0, 2*pi, 100);
        x_circle = r * cos(theta) + obs_x;
        y_circle = r * sin(theta) + obs_y;
        fill(x_circle, y_circle, 'r', 'FaceAlpha', 0.5);

        % Set plot limits and labels
        axis equal;
        xlim([0, max_x]);
        ylim([0, max_y]);
        xlabel('X Position (m)');
        ylabel('Y Position (m)');
        title('2D 2DOF Prismatic Robot');
        grid on;

        % Pause for animation
        drawnow;
        pause(0.1); % Adjust the pause duration to control animation speed

        hold off;
    end
end
