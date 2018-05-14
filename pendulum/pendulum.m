function pendulum

theta0=5*pi/180;  
v0=0;
initial_w = [theta0,v0]; % The solution at t=0 

options=odeset('RelTol',0.00001)

X0=0.015
g=9.81

% Part (a)
ohm=60*pi;
L=0.25;
[times,sols] = ode45(@eom,[0,30],initial_w,options); 
figure1=figure
plot(sols(:,1));

% Part (b)
ohm=50*pi;
L=0.25;
[times,sols] = ode45(@eom,[0,30],initial_w,options); 
figure2=figure
plot(sols(:,1));

% Part (c)
ohm=60*pi;
L=0.5
[times,sols] = ode45(@eom,[0,30],initial_w,options); 
figure3=figure
plot(sols(:,1));

% Part (d)
ohm=73*pi;
L=0.5
[times,sols] = ode45(@eom,[0,30],initial_w,options); 
figure4=figure
plot(sols(:,1));

    function dwdt = eom(t,w) 
    theta= w(1); v= w(2); 
    dthetadt = v;
    dvdt =(g/L)*(1-(ohm^2*X0/g)*sin(ohm*t))*sin(theta);

    dwdt = [dthetadt;dvdt];
    end

end
