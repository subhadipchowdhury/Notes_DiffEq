
clear all
%parameter values
alpha = 10;  
rho   = 5;
beta  = 8/3;    


% zero equilibrium 
x = 0;
y = 0;
z = 0;

% Jacobian Matrix
J = [-alpha alpha 0; rho-z -1 -x; y x -beta];
fprintf('************************************\n')
fprintf('************************************\n')
fprintf('\n')
disp(['The Jacobian matrix for equilibrium (x,y,z) = (',num2str([x,y,z])   ,') is '])
disp(J)
disp('and the Eigenvalues are:')
disp(eig(J))
fprintf('***')


% non-zero equilibrium 
x = sqrt(beta*(rho - 1));
y = sqrt(beta*(rho - 1)); 
z =  rho - 1;

% Jacobian Matrix
J = [-alpha alpha 0; rho-z -1 -x; y x -beta];
fprintf('\n')
disp(['The Jacobian matrix for the equilibirum (x,y,z) =(',num2str([x,y,z])   ,') is '])
disp(J)
disp('and the Eigenvalues are:')
disp(eig(J))
fprintf('***')

% non-zero equilibrium 
x = -sqrt(beta*(rho - 1));
y = -sqrt(beta*(rho - 1)); 
z =  rho - 1;

% Jacobian Matrix
J = [-alpha alpha 0; rho-z -1 -x; y x -beta];
fprintf('\n')
disp(['The Jacobian matrix for the equilibirum (x,y,z) =(',num2str([x,y,z])   ,') is '])
disp(J)
disp('and the Eigenvalues are:')
disp(eig(J))




