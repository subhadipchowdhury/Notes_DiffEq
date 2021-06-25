function solve_sir


%initial population values
s0 = 0.999999;
i0 = 0.000001;
r0 = 0;

t0   = 0;      %initial time
tend = 200;     %final time


%parameter values
beta  = 0.5;    
gamma = 0.2;


%we are packing all parameters into a structure called param
% [you don't need to worry about this ]
param.beta = beta;  
param.gamma = gamma;  


% put the initial values into an array
y0=[s0; i0; r0];  


% some options for the ODE solver. Don't need to worry about this
opts=odeset('Reltol',1e-6,'AbsTol',1e-6*ones(length(y0),1));


% create an array of 10000  "linearly spaced" t values starting from t0
% and ending at tend
Tspan = linspace(t0,tend,10000);

% solve the DE
[t,Y]=ode45(@rhs_of_DE,Tspan,y0,opts,param);


%Display the final values
s_end = Y(end,1); i_end = Y(end,2); r_end = Y(end,3);

disp('final values of s,i,r are:')

s_end 
i_end
r_end


% take the matrix output and store into s, i, and r vectors:
s = Y(:,1); i = Y(:,2); r = Y(:,3);

%plot the results
figure(1); 
clf; %Comment this line if plotting multiple curves on same figure
plot(t,s,'linewidth',2); 
hold on;
plot(t,i,'linewidth',2); 
hold on;
plot(t,r,'linewidth',2); 
hold on;

%The following 2 lines print the text beta=# near the local maximum 
% of i(t) graph. Uncomment those lines when plotting only i(t) graph.

%[max,index] = max(i);
%h=text(t(index)+2,max,['{\beta} = ' num2str(beta)]);

axis ([t0, tend,0,1]);
xlabel('t','fontsize',18);
set(gca,'fontsize',18);

%Change the label(s) as appropriate
legend('s','i','r');
end


% definition of the right hand side (rhs) of the system of differential
% equations
function dYdt=rhs_of_DE(t,Y,param)


beta = param.beta;
gamma = param.gamma;

s = Y(1);
i = Y(2);
r = Y(3);

dsdt = -beta*s*i; 
didt = beta*s*i -gamma*i;
drdt = gamma*i;

dYdt = [dsdt ; didt; drdt];

end