% Approximate the solution of an ODE of the form y' = f(t,y) using ODE45. 
% The function f(t,y) is defined by rhs(t,y)
function ODE45_Example
  
  clear tspan;         % Clears old time steps and
  clear yspan;         % yspan values from previous runs

  tmin=0;                        % Initial time
  tmax=3;                       % Final time
  dt = 0.1;                      % spacing size (Delta t) 
  
  
  tspan = tmin:dt:tmax;          % values of time defined in tspan 
  IC=1;                          % initial value

  opts = odeset('abstol',1e-15,'reltol',1e-15);  % set-up tolerences (do not edit this line)
  [t yspan]= ode45(@rhs,tspan,IC,opts);         % Function to solve the IVP (do not edit this line)

  
  %plot result
  figure(1); clf;                                % open figure window and clear the window
  plot(tspan,yspan,'b--','linewidth',1);   
  
  %hold on;                                       % uncomment this line and remove the clf; command if you would like to keep drawing on same figure
  
  set(gca,'fontsize',18);
  xlabel('t ','fontsize',18);
  ylabel('y(t)','fontsize',18);
  
  
  %printing the end point
  fprintf('\n The end point of the solution is approximated to be: \n ');
  disp(['y(',num2str(t(end)),') = ',num2str(yspan(end))]);  %Prints the end point in the command window
  fprintf('\n');                                            %Prints a new line
  
end

% Where you define the "right hand side" of the ODE
function dydt = rhs(t,y)
  dydt = - 2*t.*(y.^2);
end
