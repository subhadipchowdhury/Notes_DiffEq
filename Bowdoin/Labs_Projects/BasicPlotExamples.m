% Any line starting with the % symbol will be ignored by Octave (this is a
% "comment"
%
% Plot solution to the IVP P' = k P, P(0) = 3.9
% and acutal US population data from 1800's.

% System parameters;
k = log(5.3/3.9)/10;  %use data to determine growth parameter k
P0 = 3.9;             % initial population

% define a vector of time ("continuous")
t = 0:.5:60;

% Solution to ODE
P = P0*exp(k*t);

% actual population data
tdata = 0:10:60;   % discrete values of time
Pdata =[ 3.9 5.3 7.2 9.6 12 17 23];   %d iscrete set of populationd data


% =========================================================================
%Plot function P(t) only
figure(1);clf;
plot(t,P,'linewidth',2)
xlabel('t (years after 1790)','fontsize',18);
ylabel('P (Population in millions)','fontsize',18);

%Plot Data on same graph
hold on; %tell Octave to plot on same graph
plot(tdata,Pdata,'og','markersize',25);
set(gca,'fontsize',18);
xlabel('t (years after 1790)','fontsize',18);
ylabel('P (Population in millions)','fontsize',18);


% Plot both function P(t) and data  at same time on a new figure
figure(2);clf
plot(t,P,'linewidth',4,tdata,Pdata,'.','markersize',50);
set(gca,'linewidth',2,'fontsize',36);
xlabel('t (years after 1790)','fontsize',18);
ylabel('P (Population in millions)','fontsize',24);
title('Plot of suggested population function and observed data');




% =========================================================================
% Another Ploting Example

% define a vector of time ("continuous")
t = -5:.05:5;

% define a function
y = t.^2 + t - 1;  %notice the little period before the caret symbol

figure(3);clf;
plot(t,y,'linewidth',2)
set(gca,'fontsize',18);
xlabel('t ','fontsize',18);
ylabel('y(t)','fontsize',18);
