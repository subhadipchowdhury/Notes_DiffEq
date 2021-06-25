function threedim
  
  t0   = 0;      %initial time
  tend = 2;    %final time
  
  % create an array of 100  "linearly spaced" t values starting from t0 and ending at tend
  Tspan = linspace(t0,tend,1000);
  
  figure(1); clf;

  for i=-1:1:1
    for j=-1:1:1
      for k=-1:1:1

        IC = [i;j;k];
        % some options for the ODE solver. Don't need to worry about this
        opts=odeset('Reltol',1e-6,'AbsTol',1e-6*ones(length(IC),1));
     
        % solve the DE
        [t,R]=ode45(@rhs_of_DE,Tspan,IC,opts);
        
        disp('final values of x,y,z are:')

        xend = R(end,1);
        yend = R(end,2);
        zend = R(end,3);
        
        disp(['x(10)=',num2str(xend)])
        disp(['y(10)=',num2str(yend)])
        disp(['z(10)=',num2str(zend)])
        
        
        plot3(R(:,1),R(:,2),R(:,3),'linewidth',2,'r'); hold on
        plot3(IC(1),IC(2),IC(3),'g.','markersize',20);  %plot the initial value as a green point
        plot3(xend,yend,zend,'r.','markersize',20);  %plot the end value as a red point
        
        hold on;
        
        clear t; clear R;

      endfor
    endfor
  endfor
  
  xlabel('x(t)','fontsize',20)
  ylabel('y(t)','fontsize',20)
  zlabel('z(t)','fontsize',20)
  title('x(t)  y(t)  z(t) phase space','fontsize',20)
  axis tight
  set(gca,'fontsize',20)

endfunction


function dRdt=rhs_of_DE(t,R)
   dRdt = [0,4,0;-4,0,0;0,0,-1]*R;
end