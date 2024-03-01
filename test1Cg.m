function main
    % 移除了重复的 clc; clear; 以避免在函数调用间清除变量
    figure(1)
    set(0,'defaultfigurecolor','w')

    % 第一个子图，Cg=5
    subplot(3,1,1);
    plotSensitivityAnalysis(5);

    % 第二个子图，Cg=6（这里是否应该是另一个值，以观察Cg变化的影响？）
    subplot(3,1,2);
    plotSensitivityAnalysis(6); % 如果这里是为了观察Cg不同值的影响，应该修改为不同的Cg值

    % 第三个子图，Cg=7
    subplot(3,1,3);
    plotSensitivityAnalysis(7);
end

function plotSensitivityAnalysis(Cg)
    % 初始化参数，Cg作为参数传入
    PEA1=4; PEA2=4; Rg0=10; EA2=12; Cs1=5; gamma=0.5; RpA2=12; beta=0.4; omega1=0.5; omega2=0.5; EA1=12; RpA1pie=10; Cp1=10; n=5; m=5; a=0.4; RpA2pie=10; Fs1=3; Fs2=5; Fs3=4; alpha=0.4; R=8; Cp2=10; L=5; RgA1=5; RgA12=10; RgA2=5;
    [t,y]=ode45(@(t,y) andian(y,Cg,PEA1,PEA2,Rg0,Cs1,RpA2,gamma,beta,omega1,omega2,EA1,EA2,RpA1pie,Cp1,n,m,a,RpA2pie,Fs1,Fs2,Fs3,alpha,R,Cp2,L,RgA2,RgA12,RgA1),[0,5],[0.5,0.5,0.5,0.5]);
    points=1:1:length(t);
    plot(t,y(:,1),'r^-','linewidth',1,'markersize',3,'markerfacecolor','r','markerindices',points);
    hold on
    plot(t,y(:,2),'b-','linewidth',1);
    plot(t,y(:,3),'y-.','linewidth',1);
    plot(t,y(:,4),'g--','linewidth',1);
    hold off % 使用 hold off 而不是重复的 hold on
    
    % 其余设置...
    title(['$C_{g}=', num2str(Cg), '$'],'interpreter','latex');
    %图注
    % 设置图形属性
    axis([0 5 0 1]);
    set(gca, 'XTick', 0:0.5:5, 'YTick', 0.0:0.1:1.0);
    xlabel('$t$', 'Interpreter', 'latex');
    ylabel('概率', 'Interpreter', 'latex');
    title(['$C_{g}=', num2str(Cg), '$'], 'Interpreter', 'latex');
    legend('政府({\it\fontname{Bodoni MT}y})', '港口公司A1({\it\fontname{Bodoni MT}x1})', '港口公司A2({\it\fontname{Bodoni MT}x2})', '航运公司({\it\fontname{Bodoni MT}z})', 'Location', 'best');

    
end

% 定义 andian 函数...
