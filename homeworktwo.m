data= xlsread('HW-2table.xls');
t= data(:,1);
x= data(:,2);
[s1,~]= size(x);
N= 20;

MA= zeros(s1,1);
MV= zeros(s1,1);
Sk= zeros(s1,1);
Ku= zeros(s1,1);
Acor= zeros(2*s1-1,1);
Acov= zeros(2*s1-1,1);


for n=1:N-1
    MA(n)= sum(x(1:n))/n;
end

for n=N:s1
    MA(n)= sum(x(n-(N-1):n))/N;
end
figure 
plot(t,x,'k',t,MA,'r')
legend('Stock price','Moving average')
axis([0 s1 18 26])


SMA= x-MA;

figure 
plot(t,SMA,'b')
legend('Stock price minus MA')
axis([0 s1 -5 6])

for n=1:N-1
    MV(n)=sum((x(1:n)-MA(n)).^2)/n;
end

for n=N:s1
    MV(n)=sum((x(n-(N-1):n)-MA(n)).^2)/N;
end

figure 
plot(t,MV,'k')
legend('Moving Variance')
axis([0 s1 0 9])

Av= sum(x)/s1;

for n= -s1+1:s1-1
    suma= 0;
    for k=1:s1
        if k+n<=s1 && k+n>0
    suma =suma+(x(k)*(x(k+n)));
    end
    end
Acor(n+s1)= suma/N;
end
figure 
plot(Acor,'r')
legend('Autocorrelation')
axis([0 2*s1-1 -5 3500])


for n= -s1+1:s1-1
    suma= 0;
    for k=1:s1
        if k+n<=s1 && k+n>0
            suma= suma+((x(k)-Av)*(x(k+n)-Av));
        end
    end
    Acov(n+s1)= suma/s1;
end

figure 
plot(Acov,'b')
legend('Autocovariance')
axis([0 2*s1-1 -9 24])

SD= sqrt(MV);
MAp= MA+3*SD;
MAm= MA-3*SD;

figure
plot(t,x,'k',t,MA,'b',t,MAp,'r',t,MAm,'r')
legend('Stock Price', 'Moving Average','+3x Standard Deviation','-3x Standard Deviation')
axis([0 s1 15 35])

for n= 1:1:s1
    Sk(n)= sum((x(1:x)-MA(n)).^3)/(N*SD(n)^3);
end
figure 
plot(t,Sk,'m')
legend('Skew plotting')
axis([0 s1 -200 200])

for n= 1:1:s1
    Ku(n)= (sum((x(1:x)-MA(n)).^4)/(N*SD(n)^4))-3;
end






figure 
plot(t,Ku,'m')
legend('Kurtosis')
axis([0 s1 -200 200])
