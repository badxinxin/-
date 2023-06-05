function [sys,x0,str,ts] = ProgramDynamics(t,x,u,flag)


switch flag,
 
  % Initialization %
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
 
  % Derivatives % 
  case 1,
    sys=mdlDerivatives(t,x,u);
 
  % Update % 
  case 2,
    sys=mdlUpdate(t,x,u);
 
  % Outputs % 
  case 3,
    sys=mdlOutputs(t,x,u);
 
  % GetTimeOfNextVarHit % 
  case 4,
    sys=mdlGetTimeOfNextVarHit(t,x,u);
 
  % Terminate % 
  case 9,
    sys=mdlTerminate(t,x,u);

  % Unexpected flags %
 
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end

% end sfuntmpl

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes

%
% call simsizes for a sizes structure, fill it in and convert it to a
% sizes array.
%
% Note that in this example, the values are hard coded.  This is not a
% recommended practice as the characteristics of the block are typically
% defined by the S-function parameters.
%
sizes = simsizes;

sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

%
% initialize the initial conditions

x0  = [650/3.6 4/180*pi 0 6000];% v theta x  y


% str is always an empty matrix
%
str = [];

%
% initialize the array of sample times
%
ts  = [0 0];

% end mdlInitializeSizes

%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u)
v = x(1); 
theta = x(2);
xx = x(3);
y = x(4);

X = u(1);
Y = u(2);

R0 = 6371000;
g = 9.81*(R0/(R0+y))^2;
m = 225;

dv = (-X-m*g*sin(theta))/m;
dtheta = (Y-m*g*cos(theta))/(m*v);
dx = v*cos(theta);
dy = v*sin(theta);
 
 sys = [dv dtheta dx dy];

% end mdlDerivatives

%
%=============================================================================
% mdlUpdate
% Handle discrete state updates, sample time hits, and major time step
% requirements.
%=============================================================================
%
function sys=mdlUpdate(t,x,u)

sys = [];

% end mdlUpdate

%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)

sys = x;

% end mdlOutputs

%
%=============================================================================
% mdlGetTimeOfNextVarHit
% Return the time of the next hit for this block.  Note that the result is
% absolute time.  Note that this function is only used when you specify a
% variable discrete-time sample time [-2 0] in the sample time array in
% mdlInitializeSizes.
%=============================================================================
%
function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;    %  Example, set the next hit to be one second later.
sys = t + sampleTime;

% end mdlGetTimeOfNextVarHit

%
%=============================================================================
% mdlTerminate
% Perform any end of simulation tasks.
%=============================================================================
%
function sys=mdlTerminate(t,x,u)

sys = [];

% end mdlTerminate
