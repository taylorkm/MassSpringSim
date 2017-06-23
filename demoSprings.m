l1 = 2;
l2 = 2;
m1 = 1;
m2 = 1;
k1 = 1;
k2 = 1;

y0 = [.25;0;0;0];

f = @(t,y)evolutionFunction(t,y,m1,m2,k1,k2);


tSpan = [0,30];
[t,y] = ode45(f, tSpan, y0);
temp = repmat([l1,0,l1+l2,0],size(y,1),1)+y;

figure
plot(t,temp(:,[1,2,3,4]),t,repmat([l1,l1+l2],size(temp,1),1))
xlabel('time')
ylabel('position')
legend('Mass 1','Mass 2')

figure
plot(temp(:,1),temp(:,3),'k-','linewidth',2)
xlabel('y3')
ylabel('y1')


figure
axis([0,l1+l2+y0(3)+2,-1,1]);
% axis tight manual
ax = gca;
ax.NextPlot = 'replaceChildren';


nFrames = size(temp,1);
F(nFrames) = struct('cdata',[],'colormap',[]);
for j = 1:nFrames
    cla();
    line(temp(j,1),0,'marker','o','color','red',...
        'markersize',30,'markerfacecolor','red')
    line(temp(j,3),0,'marker','o','color','blue',...
        'markersize',30,'markerfacecolor','blue')    
    drawnow
    F(j) = getframe;
end
