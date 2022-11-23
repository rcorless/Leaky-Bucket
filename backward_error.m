%-------------------------------------------------------------------------
%
% File: backward_error.m
% Author: Julia Jankowski
% Date: July 2015
%
% Purpose:
%-------------------------------------------------------------------------

clf
close all
for N= [3,30,300]
    
    y = zeros(2*N+1,1);
    dt = 1/N;
    y(1) = 1;
    
    %backward Euler method
    for k = 2:2*N+1
        y(k)= 4*y(k-1)^2/ (dt+ sqrt(dt^2 + 4*y(k-1)))^2;
    end
    
    delta = zeros(2*N,1);
    
    %compute the optimal backward error for the backward Euler method
    for k = 1:2*N
        delta(k)= 2*(sqrt(y(k))-sqrt(y(k+1)))/dt -1;
    end
    
    tau = linspace(0,2,2*N+1);
    
    %plot error on semilog plot
    semilogy(tau(1:2), [delta(1),delta(1)], 'k-');
    hold on
    
    for k=1:2*N
        if delta(k) == 0,
            break
        end
        semilogy(tau(k:k+1), [delta(k),delta(k)], 'k-');
    end
end

%add labels and set font sizes

set(gca,'fontsize', 18);
%title('Backward Euler')
xlabel('t')
ylabel('\delta')

set(gca,'fontsize', 18);

x1=0.4;
y1= -10^(-1.2);

str1 = '\Delta t= 1/3';
txt1 = text(x1,y1,str1)
txt1.FontSize=14;

x2=0.4;
y2= -10^(-2.2);

str2 = '\Delta t= 1/30';
txt2 = text(x2,y2,str2)
txt2.FontSize=14;


x3=0.4;
y3= -10^(-3.2);

str3 = '\Delta t= 1/300';
txt3 = text(x3,y3,str3)
txt3.FontSize=14;