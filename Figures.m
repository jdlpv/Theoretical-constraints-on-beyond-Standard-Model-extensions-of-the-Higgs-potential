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