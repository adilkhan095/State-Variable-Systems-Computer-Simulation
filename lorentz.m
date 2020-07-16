function [t,x]= lorentz()
time= [0 150];
x0= [0.4,0.4,0.4];
[t x]= ode23(@lorenzeq,time,x0);

plot(t,x)
legend('x1','x2','x3')
xlabel('t')
ylabel('x')

figure
plot3(x(:,1),x(:,2),x(:,3))
xlabel('x1')
ylabel('x2')
zlabel('x3')
end

% function dx=lorenzeq(t,x)
% s= 10; r= 28; b= 8/3;
% dx=[-s*(x(1)-x(2)); r*x(1)-x(2)-x(1)*x(3); -b*x(3)+x(1)*x(2)];
% end