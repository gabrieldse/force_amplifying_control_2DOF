function plot_prismatic_robot(x, y,obs_x,obs_y,r)
    % PLOT_PRISMATIC_ROBOT - Plot a 2D 2DOF prismatic robot with a 1m x 1m range.
    % Inputs:
    %   x - Horizontal position of the robot end-effector (0 <= x <= 1).
    %   y - Vertical position of the robot end-effector (0 <= y <= 1).
    
    % Define maximum reach limits
    max_x = 1; % 1 meter range in x
    max_y = 1; % 1 meter range in y

    % Validate inputs
    if x < 0 || x > max_x || y < 0 || y > max_y
        error('Input x and y should be within the range [0, 1] meters.');
    end

    % Define base of the robot at the origin
    base = [0, 0];
    
    % Define joint positions
    joint1 = [x, 0]; % First prismatic joint moves along x-axis
    end_effector = [x, y]; % Second prismatic joint moves along y-axis to reach (x, y)

    % Plot the robot structure
    figure;
    hold on;
    plot([base(1), joint1(1)], [base(2), joint1(2)], 'b-o', 'LineWidth', 2); % x-axis prismatic joint
    plot([joint1(1), max_x], [base(2), joint1(2)], 'b-o', 'LineWidth', 2); % x-axis prismatic joint
    plot([joint1(1), end_effector(1)], [joint1(2), end_effector(2)], 'r-o', 'LineWidth', 2); % y-axis prismatic joint
    plot([joint1(1), end_effector(1)], [end_effector(2), max_y], 'r-o', 'LineWidth', 2); % y-axis prismatic joint
    
    % Plot the end effector position
    plot(end_effector(1), end_effector(2), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);

    % Plot the obstacle
    p = nsidedpoly(1000, 'Center', [obs_x obs_y], 'Radius', r);
    plot(p, 'FaceColor', 'r')

    % Set plot limits and labels
    axis equal;
    xlim([0, max_x]);
    ylim([0, max_y]);
    xlabel('X Position (m)');
    ylabel('Y Position (m)');
    title('2D 2DOF Prismatic Robot');
    grid on;
    
    hold off;
end
