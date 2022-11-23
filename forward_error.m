%-------------------------------------------------------------------------
%
% File: forward_error.m
% Author: Julia Jankowski 
% Date: July 2015
%
% Purpose: Compute the optimal backward error for the forward Euler method
%-------------------------------------------------------------------------


clf
close all

for N= [3,30,300]
    
    y = zeros(2*N+1,1);
    dt = 1/N;
    y(1) = 1;
    
    %forward Euler method
    for k = 2:2*N+1
        y(k) = y(k-1)- dt*sqrt(y(k-1));
        if y(k)< 0
            break;
        end
    end
    
    delta = zeros(2*N,1);
    
    %compute the optimal backward error for the forward Euler method
    for k = 1:2*N
        if y(k+1)>0
            delta(k)= 2*(sqrt(y(k))-sqrt(y(k+1)))/dt -1;
        end
    end
    
    tau = linspace(0,2,2*N+1);
    
    %plot error on semilog plot
    semilogy(tau(1:2), abs([delta(1),delta(1)]), 'k-');
    
    hold on
    
    for k=1:2*N
        if delta(k) == 0,
            break
        end
        
        semilogy(tau(k:k+1), abs([delta(k),delta(k)]), 'k-');
    end
    
end

%add labels and set font sizes
set(gca,'fontsize', 18);

xlabel('t')
ylabel('\delta')

x1= 0.4;
y1= 10^(-0.5);

str1 = '\Delta t= 1/3';
txt1 = text(x1,y1,str1)
txt1.FontSize=14;

%
x2= 0.4;
y2= 10^(-1.8);
str2 = '\Delta t= 1/30';
txt2 = text(x2,y2,str2)
txt2.FontSize=14;

%
x3= 0.4;
y3= 10^(-2.8);
str3 = '\Delta t= 1/300';
txt3 = text(x3,y3,str3)
txt3.FontSize=14;


