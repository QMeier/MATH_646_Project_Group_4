%PlotGenerator3D in MATH_646_Project_Group_4
%Version 0.0.0 Last Edited November 17th, 2018
%
%This function takes in information on a 2D Schrodinger equation, creates a
%.stl file, and returns a 3D plot of the waveform.
%
%
%
%
%
%
function [] = PlotGenerator3D(xStep, tStep)
m = 0;
x = linspace(0,1,xStep);
t = linspace(0,2,tStep);

sol = pdepe(m,@pdex1pde,@pdex1ic,@pdex1bc,x,t);
% Extract the first solution component as u.
u = sol(:,:,1);

% A surface plot is often a good way to study a solution.
surf(x,t,u) 
title('Numerical solution computed with 20 mesh points.')
xlabel('Distance x')
ylabel('Time t')
end

% --------------------------------------------------------------
function [c,f,s] = pdex1pde(x,t,u,DuDx)
c = (1i)*1.0546e-34;
f = DuDx;
s = 0;
end

% --------------------------------------------------------------
function u0 = pdex1ic(x)
u0 = 0;
end

% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdex1bc(xl,ul,xr,ur,t)
pl = 0;
ql = 0;
pr = 0;
qr = 0;
end