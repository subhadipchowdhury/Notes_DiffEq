function solve_lorenz

%initial values
x0 = 1.000001;
y0 = 0;
z0 = 0;

t0   = 0;      %initial time
tend = 40;    %final time

%parameter values
alpha = 10;  
rho   = 5;
beta  = 8/3;    


%we are packing all parameters into a structure called param
% [you don't need to worry about this ]
param.alpha = alpha;  
param.rho = rho;  
param.beta = beta; 

% put the initial values into an array
r0=[x0; y0; z0];  

% some options for the ODE solver. Don't need to worry about this
opts=odeset('Reltol',1e-6,'AbsTol',1e-6*ones(length(r0),1));


% create an array of 10000  "linearly spaced" t values starting from t0 
%and ending at tend
Tspan = linspace(t0,tend,10000);

% solve the DE
[t,R]=ode45(@rhs_of_DE,Tspan,r0,opts,param);

%Display the final values
xend = R(end,1);
yend = R(end,2);
zend = R(end,3);

disp('final values of x,y,z are:')

xend
yend
zend


% take the matrix output and store into x,y, and z vectors:
x = R(:,1); y = R(:,2); z = R(:,3);


%plot the x,y,z vs t graphs
figure(1); 
clf; 
plot(t,x,'linewidth',2); hold on;
plot(t,y,'linewidth',2); hold on;
plot(t,z,'linewidth',2); 

xlabel('t','fontsize',20)
legend('x','y','z');


%plot the 3D phase space
figure(2); 
clf;
plot3(x,y,z,'b','linewidth',2);  hold on;
plot3(x0,y0,z0,'g.','markersize',20);  %plot the initial value as a green point
plot3(xend,yend,zend,'r.','markersize',20);  %plot the end value as a red point

xlabel('x(t)','fontsize',20)
ylabel('y(t)','fontsize',20)
zlabel('z(t)','fontsize',20)
title('x(t)  y(t)  z(t) phase space','fontsize',20)
axis tight
set(gca,'fontsize',20)

end


% definition of the right hand side (rhs) of the system of differential
% equations
function dRdt=rhs_of_DE(t,R,param)

alpha = param.alpha;
beta = param.beta;
rho = param.rho;

x = R(1);
y = R(2);
z = R(3);

dxdt = alpha*(y-x); 
dydt = x*(rho-z)-y;
dzdt = -beta*z+x*y ;

dRdt = [dxdt ; dydt; dzdt];

end