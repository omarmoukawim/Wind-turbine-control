clear all
close all
clc
disp('Loading simulation parameters ...')

% Parameters of the turbine

R=46.6;     % m (radius of the turbine)
Rs=0.821;   % Ohm
L=1.5731e-3; % H
phim=5.8264; % Wb
p=26; %couple of pole
J=34.6e3; %Kg m^2
f=1.5e-3; %Kg m^2/s
km=3*p*phim/2;

% Values of the coefficients in the Cp function
c1=0.5176;
c2=116;
c3=0.035;
c4=5;
c5=21;
c6=0.0068;

% Air density
rho=1.225;

% Maximum of Cp with the involved coeeficients
syms lambda
Cp=c1*(c2*(1/lambda-c3)-c4)*exp(-c5*(1/lambda-c3))+c6*lambda;
Dlambda0=diff(Cp,lambda);
lambda_max=vpasolve(Dlambda0==0,lambda,[0,20]);
lambda=lambda_max;
Cp_max=0.48;

% Wind torque
kw=eval(rho*pi*R^5*Cp_max/(2*lambda_max^3));
lambda_max=double(lambda_max);

% Initial condition

id0=1.5;
iq0=2000;
w0=2;

sampling=0.01;
quantization_error=0.001;

disp('... parameters have been loaded.')