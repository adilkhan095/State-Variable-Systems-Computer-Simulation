# Stock-Market-Time-Series-Analysis
UTA EE 5322 Spring 2019
This Project was created to as a part of coursework for UTA EE 5322 under Dr Frank Lewis.

HOW TO RUN THE CODE: 1) Make sure the Excel files (attached in the repository) are in the same folder as the .m file.

                     2)Apply the following Code

% data
info= xlsread('HW-2table.xls');
t= info(:,1);
x= info(:,2);
[s1,~]= size(x);
N= 20;

%Declaring variables
MA= zeros(s1,1);
MV= zeros(s1,1);
Sk= zeros(s1,1);
Ku= zeros(s1,1);
Acor= zeros(2*s1-1,1);
Acov= zeros(2*s1-1,1);

%MA for first 19 days
for n=1:N-1
    MA(n)= sum(x(1:n))/n;      mean(x(1:n))
end

%MA for the 20th day
for n=N:s1
    MA(n)= sum(x(n-(N-1):n))/N;      mean(
end
plot(t,x,'k',t,MA,'b')
legend('Stock price','Moving average')
axis([0 s1 18 32])

%Stock-MA

SMA= x-MA;

figure
plot(t,SMA,'b')
legend('Stock price minus MA')
axis([0 s1 -4 5])

%MV for the first 19 days
for n=1:N-1
    MV(n)=sum((x(1:n)-MA(n)).^2)/n;
end
%MV for 20th day
for n=N:s1
    MV(n)=sum((x(n-(N-1):n)-MA(n)).^2)/N;
end

figure
plot(t,MV,'b')
legend('Moving Variance')
axis([0 s1 0 5])

%overall autocorellation


%Overall autocovariance

Av= sum(x)/s1;

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
axis([0 2*s1-1 -5 10])

SD= sqrt(MV);
MAp= MA+3*SD;
Mam= MA-3*SD;

figure
plot(t,x,'k',t,MA,'b',t,MAp,'r',t,MAm,'r')
legend('Stock Price', 'Moving Average','+3x Standard Deviation','-3x Standard Deviation')
axis([0 s1 15 35])

for n= 2:N-1
    Sk(n)= sum((x(1:n)-MA(n)).^3)/(n+SD(n)^3);
end



