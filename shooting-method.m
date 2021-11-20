%%
clear all
close all
clc;


y0=0;
v0=1.5;

dt=0.01;
tf=60; 
t=0:dt:tf;
N=length(t);

B=2.15;

u(1)=0.35;
u(2)=0.4;

iter_max=20;
tolerancia=1e-12;

for i=1:iter_max
    reltol = 3e-14; abstol_1=1e-13;abstol_2=1e-13;
    %ode45
    options = odeset('RelTol',reltol,'AbsTol',[abstol_1 abstol_2]);
    [t,sol] = ode45(@funcao,t,[y0 v0],options, u(i));
    y=sol(:,1); v=sol(:,2);
    
    %Determinação de máximos
    maximo=0;
    N=length(t);
    for n=2:N-1
        if and(sol(n-1,1)<=sol(n,1),sol(n,1)>=sol(n+1,1))
            maximo=maximo+1;
            aux=lagr(t(n-1:n+1),sol(n-1:n+1,1));
            tmax(maximo)=aux(1);
            ymax(maximo)=aux(2);
        end
    end
    
    amplitude(i)=mean(ymax);
    
    clear tmax
    clear ymax

    if (i>=2)
        if abs(( amplitude(i)- B)) < tolerancia
            break  %Critério de paragem 
        end
    dif=(amplitude(i)-amplitude(i-1))/(u(i)-u(i-1));
    u(i+1)=u(i) + (B-amplitude(i))/dif;
    end 
    
end 
%% Mu:
mu=u(i)