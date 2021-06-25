function Euler

  clear t;                        % Clears old time steps and
  clear y;                        % y values from previous runs
  
  tmin=0;                        % Initial time
  tmax=1/2;                      % Final time
  dt = 0.1;                      % what is this line doing?
  
  IC=1;                          % define the initial condition for the problem

  t = tmin : dt : tmax;          % what does this line do?
  y = zeros(size(t));            % what does this line do?
  y(1) = IC;                     % what does this line do?

  for n=1:length(t) - 1          % what does this line do?
    y(n+1)=y(n)+dt*f(t(n),y(n)); % Calls the function f(t,y)=dy/dt
  end


  disp('t='); disp(t);
  disp('y='); disp(y);
  disp(['y(',num2str(t(end)),') = ',num2str(y(end))]);

  figure(1); clf;        
  plot(t,y,'linewidth',4,t,y,'.','markersize',35);
  grid on;
  xlabel('time','fontsize',20);
  ylabel('y(t)','fontsize',20);
  title(['Euler Method by MYNAME'],'fontsize',20); % Include your own name
end


function f = f(t,y)
  f = -t./y;                     % Notice the . before /
end