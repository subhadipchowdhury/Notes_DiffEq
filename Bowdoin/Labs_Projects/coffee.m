function coffee
    flowtime=20;             % flowtime of each iteration
    dt = .1;                 % spacing size (Delta t) 
    tspan = 0:dt:flowtime;   % values of t defined in tspan 
    
    y0 =  0;                 % initial value
    n_iter = 5;              % number of dosage 
    kick = 200;              % dosage strength
    
    
    
    opts = odeset('abstol',1e-10,'reltol',1e-10);  % set-up tolerences (do not edit this line)
    
    N=length(tspan);
    yspan = zeros(N)+y0;
    
    figure(1);        clf; 
    plot (0,y0, '.r', 'markersize', 30);
    
    for i=0:1:n_iter                                 % Loop over the number of iterations
      y0 = yspan(end) + kick;
      [t,yspan]= ode45(@rhs, tspan,y0,opts);         % Matlab/Octave function to solve the IVP
      %plot result
      plot(tspan,yspan,'r','linewidth',3)            % plot approximation 
      
      hold on;
      
      line ([tspan(end) tspan(end)], [yspan(end) yspan(end) + kick], "linestyle", "-", "color", "b",'linewidth',2); %Line depicting the kick
      
      hold on;
      plot (tspan(end), yspan(end), '.r', 'markersize', 30);   %The \psi values
      
      tspan = tspan + flowtime;
      
      hold on;
    endfor

    % format the plot
    axis ([0, flowtime*n_iter, 0 ,600]);
    set(gca,'fontsize',28)                      % change fontsize of numeric labels
    xlabel('t [hour]','fontsize',28)            % change fontsize of X-axis labels
    ylabel('y(t) [mg]','fontsize',28)           % change fontsize of Y-axis labels
    

    fprintf('\n The end point of the solution is approximated to be: \n ')
    disp(['y(',num2str(t(end)),') = ',num2str(yspan(end))])
    fprintf('\n')
endfunction

% Where you define the "right hand side" of the ODE
function dydt = rhs(t,y)
  dydt = -0.1*y;
endfunction
