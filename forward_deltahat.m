%-------------------------------------------------------------------------
%
% File: forward_deltahat.m
% Author: Julia Jankowski
% Date: July 2015
%
% Purpose: Compute the optimal backward error for a modified equation using
%          the forward Euler method
%-------------------------------------------------------------------------

clf
close all

for N= [3,30,300]
    
    y = zeros(2*N+1,1);
    dt = 1/N;
    y(1) = 1;
    
    %forward Euler method
    for k=2:2*N+1
        y(k) = y(k-1)- dt*sqrt(y(k-1));
    end
    
    delta= zeros(2*N,1);
    
    %compute optimal backward error for the forward Euler method 
    %note the additional term
    for k=1:2*N
        delta(k)= 2*(sqrt(y(k))-sqrt(y(k+1)))/dt+1/4*log(y(k+1)/y(k))-1;
    end
    
    tau = linspace(0,2,2*N+1);
    
    semilogy(tau(1:2), [delta(1),delta(1)], 'k-');
    hold on
    
    %plot error on semilog plot
    for k=1:2*N
        if delta(k) == 0,
            break
        end
        semilogy(tau(k:k+1), abs([delta(k),delta(k)]), 'k-');
    end
    
    x1=0.4;
    y1= 10^(-2.8);
    
    str1 = '\Delta t= 1/3';
    txt1 = text(x1,y1,str1)
    txt1.FontSize=14;
    
    x2=0.4;
    y2= 10^(-5.9);
    
    str2 = '\Delta t= 1/30';
    txt2 = text(x2,y2,str2)
    txt2.FontSize=14;
    
    
    x3=0.4;
    y3= 10^(-8.9);
    
    str3 = '\Delta t= 1/300';
    txt3 = text(x3,y3,str3)
    txt3.FontSize=14;
    
end

set(gca,'fontsize', 22);

xlabel('t')
ylabel('$$\hat{\delta}$$','Interpreter','Latex')

axis([0 2 10^(-10) 10^(-2)])

