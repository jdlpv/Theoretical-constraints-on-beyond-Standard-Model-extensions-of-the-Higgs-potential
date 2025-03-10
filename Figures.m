clear
clc
close all

% Z_2-conserving xSM

figure('Units','pixels', 'Position', [400, 400, 800, 800])

subplot(3,2,1)
x_raw=linspace(-10,10,1000);
y_raw=linspace(-10,10,1000);
[x,y]=meshgrid(x_raw,y_raw);
rho_3=2;
V=1/2.*x.^2+1/2.*y.^2+rho_3.*x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}\Phi\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=S^2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$\rho_{3}=2$','fontsize',15,'Interpreter','Latex')

hold on
zeros_vector=linspace(0,0,10);
w_eje=linspace(0,10,10);
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)

subplot(3,2,2)
rho_3=1;
V=1/2.*x.^2+1/2.*y.^2+rho_3.*x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}\Phi\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=S^2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$\rho_{3}=1$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)

subplot(3,2,3)
rho_3=1/2;
V=1/2.*x.^2+1/2.*y.^2+rho_3.*x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}\Phi\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=S^2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$\rho_{3}=1/2$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)

subplot(3,2,4)
rho_3=-1/2;
V=1/2.*x.^2+1/2.*y.^2+rho_3.*x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}\Phi\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=S^2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$\rho_{3}=-1/2$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)

subplot(3,2,5)
rho_3=-1;
V=1/2.*x.^2+1/2.*y.^2+rho_3.*x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}\Phi\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=S^2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$\rho_{3}=-1$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)

subplot(3,2,6)
rho_3=-2;
V=1/2.*x.^2+1/2.*y.^2+rho_3.*x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}\Phi\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=S^2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$\rho_{3}=-2$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Z_2-conserving 2HDM Case 1

figure('Units','pixels', 'Position', [400, 400, 800, 800])

rho_3=1;
rho_4=2;
rho_5=1;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0); 

subplot(2,2,1)
x_1=linspace(0,1,100);
y_1=linspace(-1,1,100);
[x_1,y_1]=meshgrid(x_1,y_1);
zeros_vector_1=linspace(0,0,100);
w_eje_1=linspace(-1,1,100);
rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(zeros_vector_1,w_eje_1,'.r')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,2)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)

rho_3=-1;
rho_4=2;
rho_5=1;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0);

subplot(2,2,3)

rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(zeros_vector_1,w_eje_1,'.r')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,4)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Z_2-conserving 2HDM Case 2

figure('Units','pixels', 'Position', [400, 400, 800, 800])

rho_3=1;
rho_4=1;
rho_5=1;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0); 

subplot(2,2,1)
r_eje=linspace(0,1,100);
b_eje=linspace(-1,-1,100);
rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(zeros_vector_1,w_eje_1,'.r')
plot(r_eje,b_eje,'.r')
plot(1,-1,'or')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,2)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)


rho_3=-1;
rho_4=1;
rho_5=1;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0);

subplot(2,2,3)

rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(zeros_vector_1,w_eje_1,'.r')
plot(r_eje,b_eje,'.r')
plot(1,-1,'or')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,4)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Z_2-conserving 2HDM Case 3

figure('Units','pixels', 'Position', [400, 400, 800, 800])

rho_3=1;
rho_4=-1;
rho_5=0;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0); 

subplot(2,2,1)

ones_vector_1=linspace(1,1,100);
rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(ones_vector_1,w_eje_1,'.r')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,2)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)


rho_3=-1;
rho_4=-1;
rho_5=0;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0);

subplot(2,2,3)

rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(ones_vector_1,w_eje_1,'.r')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,4)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Z_2-conserving 2HDM Case 4

figure('Units','pixels', 'Position', [400, 400, 800, 800])

rho_3=1;
rho_4=0;
rho_5=1;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0); 

subplot(2,2,1)

rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(1,-1,'or')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,2)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)


rho_3=-1;
rho_4=0;
rho_5=1;
rho_3_eff=rho_3+min(rho_4-abs(rho_5),0);

subplot(2,2,3)

rho_eff_1=rho_3+x_1.*rho_4+x_1.*rho_5.*y_1;
contourf(x_1,y_1,rho_eff_1)
hold on
plot(1,-1,'or')
colorbar
title('$\ \ \rho^{eff}_3$','fontsize',15,'Interpreter','Latex')
grid on
xlabel('$r^2$','fontsize',15,'Interpreter','Latex')
ylabel('$cos(\gamma+\beta)$','fontsize',15,'Interpreter','Latex')

subplot(2,2,4)

V=1/2.*x.^2+1/2.*y.^2+x.*y.*rho_3_eff;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Quadratic Terms and loops (Master's Thesis section)

figure('Units','pixels', 'Position', [400, 400, 1600, 800])

sigma_1=1;
sigma_2=-10;


subplot(1,2,1)
title('$V^{Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

V=-sigma_1.*x-sigma_2.*y+1/2.*x.^2+1/2.*y.^2-x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',25,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',25,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',25,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)


sigma_1=1;
sigma_2=10;

subplot(1,2,2)

V=-sigma_1.*x-sigma_2.*y+1/2.*x.^2+1/2.*y.^2-x.*y;
contourf(x,y,V)
colorbar
grid on
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',25,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',25,'Interpreter','Latex')
title('$V^{Z_2}_{2HDM}$','fontsize',25,'Interpreter','Latex')

hold on
plot(w_eje,zeros_vector,'--w', 'linewidth', 1.5)
plot(zeros_vector,w_eje,'--w', 'linewidth', 1.5)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Symmetric Z_2-violating potential

figure('Units','pixels', 'Position', [0, 0, 1000, 1500])

subplot(6,2,1)
rho_3_eff=1.5;
u=-1.5;
s=linspace(0,1,1000);
f=(rho_3_eff-1).*s.^2+u.*s+2;
plot(s,f,'m','linewidth',1.5)
grid on
ylim([-0.5,2.5])
xlim([0,1])
xlabel('$s$','fontsize',15,'Interpreter','Latex')
title('$f(s)$','fontsize',15,'Interpreter','Latex')
hold on
plot(w_eje,zeros_vector,'--k', 'linewidth', 1)

hold on

subplot(6,2,2)


rho_3_eff=1.5;
rho_6_eff=-0.75;
rho_7_eff=-0.75;

x=linspace(0,10,1000);
y=x;
[xv,yv]=meshgrid(x,y);
zv=(1/2).*xv.^2+(1/2).*yv.^2+rho_3_eff.*xv.*yv+rho_6_eff.*xv.*sqrt(xv.*yv)+rho_7_eff.*yv.*sqrt(xv.*yv);
contourf(xv,yv,zv)
colorbar
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{\ \backslash\hspace*{-0.18cm}Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on


subplot(6,2,3)
rho_3_eff=1.5;
u=-3;
f=(rho_3_eff-1).*s.^2+u.*s+2;
plot(s,f,'m','linewidth',1.5)
grid on
ylim([-1,2.5])
xlim([0,1])
xlabel('$s$','fontsize',15,'Interpreter','Latex')
title('$f(s)$','fontsize',15,'Interpreter','Latex')
hold on
plot(w_eje,zeros_vector,'--k', 'linewidth', 1)

hold on

subplot(6,2,4)


rho_3_eff=1.5;
rho_6_eff=-1.5;
rho_7_eff=-1.5;

zv=(1/2).*xv.^2+(1/2).*yv.^2+rho_3_eff.*xv.*yv+rho_6_eff.*xv.*sqrt(xv.*yv)+rho_7_eff.*yv.*sqrt(xv.*yv);
contourf(xv,yv,zv)
colorbar
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{\ \backslash\hspace*{-0.18cm}Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')


hold on

subplot(6,2,5)

rho_3_eff=10;
u=-8;
f=(rho_3_eff-1).*s.^2+u.*s+2;
plot(s,f,'m','linewidth',1.5)
grid on
ylim([-0.5,3.5])
xlim([0,1])
xlabel('$s$','fontsize',15,'Interpreter','Latex')
title('$f(s)$','fontsize',15,'Interpreter','Latex')
hold on
plot(w_eje,zeros_vector,'--k', 'linewidth', 1)

hold on

subplot(6,2,6)


rho_3_eff=10;
rho_6_eff=-4;
rho_7_eff=-4;

zv=(1/2).*xv.^2+(1/2).*yv.^2+rho_3_eff.*xv.*yv+rho_6_eff.*xv.*sqrt(xv.*yv)+rho_7_eff.*yv.*sqrt(xv.*yv);
contourf(xv,yv,zv)
colorbar
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{\ \backslash\hspace*{-0.18cm}Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on


subplot(6,2,7)
rho_3_eff=10;
u=-10;
f=(rho_3_eff-1).*s.^2+u.*s+2;
plot(s,f,'m','linewidth',1.5)
grid on
ylim([-2.5,2.5])
xlim([0,1])
xlabel('$s$','fontsize',15,'Interpreter','Latex')
title('$f(s)$','fontsize',15,'Interpreter','Latex')
hold on
plot(w_eje,zeros_vector,'--k', 'linewidth', 1)

hold on

subplot(6,2,8)

rho_3_eff=10;
rho_6_eff=-5;
rho_7_eff=-5;

x=linspace(0,10,1000);
y=x;
[xv,yv]=meshgrid(x,y);
zv=(1/2).*xv.^2+(1/2).*yv.^2+rho_3_eff.*xv.*yv+rho_6_eff.*xv.*sqrt(xv.*yv)+rho_7_eff.*yv.*sqrt(xv.*yv);
contourf(xv,yv,zv)
colorbar
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{\ \backslash\hspace*{-0.18cm}Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')


subplot(6,2,9)
rho_3_eff=-1.5;
u=1.5;
f=(rho_3_eff-1).*s.^2+u.*s+2;
plot(s,f,'m','linewidth',1.5)
grid on
ylim([-0.5,2.5])
xlim([0,1])
xlabel('$s$','fontsize',15,'Interpreter','Latex')
title('$f(s)$','fontsize',15,'Interpreter','Latex')
hold on
plot(w_eje,zeros_vector,'--k', 'linewidth', 1)

hold on

subplot(6,2,10)


rho_3_eff=-1.5;
rho_6_eff=0.75;
rho_7_eff=0.75;

zv=(1/2).*xv.^2+(1/2).*yv.^2+rho_3_eff.*xv.*yv+rho_6_eff.*xv.*sqrt(xv.*yv)+rho_7_eff.*yv.*sqrt(xv.*yv);
contourf(xv,yv,zv)
colorbar
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{\ \backslash\hspace*{-0.18cm}Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')

hold on


subplot(6,2,11)
rho_3_eff=-5;
u=1.5;
f=(rho_3_eff-1).*s.^2+u.*s+2;
plot(s,f,'m','linewidth',1.5)
grid on
ylim([-3,2.5])
xlim([0,1])
xlabel('$s$','fontsize',15,'Interpreter','Latex')
title('$f(s)$','fontsize',15,'Interpreter','Latex')
hold on
plot(w_eje,zeros_vector,'--k', 'linewidth', 1)

hold on

subplot(6,2,12)

rho_3_eff=-5;
rho_6_eff=0.75;
rho_7_eff=0.75;

zv=(1/2).*xv.^2+(1/2).*yv.^2+rho_3_eff.*xv.*yv+rho_6_eff.*xv.*sqrt(xv.*yv)+rho_7_eff.*yv.*sqrt(xv.*yv);
contourf(xv,yv,zv)
colorbar
xlabel('$x=\Phi^{\dagger}_1\Phi_1\sqrt{\lambda_1}$','fontsize',15,'Interpreter','Latex')
ylabel('$y=\Phi^{\dagger}_2\Phi_2\sqrt{\lambda_2}$','fontsize',15,'Interpreter','Latex')
title('$V^{\ \backslash\hspace*{-0.18cm}Z_2}_{2HDM}$','fontsize',15,'Interpreter','Latex')
