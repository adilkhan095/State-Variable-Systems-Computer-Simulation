function [t,x]= vanderpol()
time= [0 100];
x0= [0.1;0.1];
[t,x]= ode23('vanderpol2',time,x0);
plot(t,x(:,1),'r')
legend('y(t)')
xlabel('time')
ylabel('y(t)')

figure(2)
plot(x(:,1),x(:,2),'r--')
legend('y(t) vs ydot(t)')
xlabel('y(t)')
ylabel('ydot(t)')
end


function xdot=vanderpol2(t,x)
a=0.85;
xdot=[x(2);-a*(x(1)^2-1)*x(2)-x(1)];
end
