function Paul_trap

X0=0.1; Y0=0; Z0=0.1; % The initial position 
VX0=0; VY0=0.1; VZ0=0; 
initial_w = [X0,Y0,Z0,VX0,VY0,VZ0]; % The solution at t=0 

ohm=1;

% Part(a)
beta=0;
omega=0;
[times,sols] = ode45(@eom,[0,60],initial_w); 
figure1=figure
plot3(sols(:,1),sols(:,2),sols(:,3)) % Plot the trajectory

% Part (b)
beta=30;
omega=12;
[times,sols] = ode45(@eom,[0,60],initial_w); 
figure2=figure
plot3(sols(:,1),sols(:,2),sols(:,3)) % Plot the trajectory

% Part (c)
beta=30;
omega=11;
[times,sols] = ode45(@eom,[0,60],initial_w); 
figure2=figure
plot3(sols(:,1),sols(:,2),sols(:,3)) % Plot the trajectory

% Part (d)
beta=30;
omega=22
[times,sols] = ode45(@eom,[0,60],initial_w); 
figure2=figure
plot3(sols(:,1),sols(:,2),sols(:,3)) % Plot the trajectory


    function dwdt = eom(t,w) 
    % Variables stored as follows w = [x,y,z,vx,vy,vz] 
    % i.e. x = w(1), y=w(2), z=w(3), etc 
    x = w(1); y=w(2); z=w(3); 
    vx = w(4); vy = w(5); vz = w(6); 
    V=sqrt(vx^2+vy^2+vz^2) 
    dxdt = vx; dydt = vy; dzdt = vz; 
    dvxdt = (ohm^2)*(1+beta*cos(omega*t))*x; 
    dvydt = (ohm^2)*(1+beta*cos(omega*t))*y; 
    dvzdt = -2*(ohm^2)*(1+beta*cos(omega*t))*z;

    dwdt = [dxdt;dydt;dzdt;dvxdt;dvydt;dvzdt];
    end

end
