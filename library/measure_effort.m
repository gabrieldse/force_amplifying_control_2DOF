function F = measure_effort(X,OBS,K,r)
    % Function that has the position of the robot (ponctual), the obstacle (circle
    % centered at (obs_x, obs_y) and of radius r, calculate distance when you
    % encounter the "organe" and models the PUSH BACK FORCE at the robot as a spring 
    % of stiffness K
    
    % X, OBS are 2x1 vectors
    % K is a 2x2 diagonal
    
    %% TODO - come back to it later
    
    R = [r ; r];
    d = sqrt((OBS(1)-X(1))^2 + (OBS(2)-X(2))^2)
    
    if d >= r
       F = [ 0; 0];
    else 
       diff = X-OBS
       pen_dist = (R-X)'*(diff/norm(diff))
       F = K*pen_dist;
    end

end
