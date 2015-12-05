%Optimization



%X = ['S' 'AR' 'TR' 'sweep']

fun = @optfun;
x0 = [450,9,0.15,35];
lb = [300 7 0.1 30];
ub = [1000 11 0.2 40];

S = 100:500;
A = 9;
lamda = 0.15;
Sweep_LE = 35;

for i = 1:length(S)
    InputFile
    [t0, w0, wf] = T0_iteration( 0.25, W0_guess ,S(i),1,A,lamda,Sweep_LE);
    cost(i) = COC(t0, w0, wf);
%     if (t0 >   9.72e+05)
%         cost(i) = 0;
%     end
end
figure(1)
plot(S,cost,'LineWidth',2)
xlabel('S_{ref} [m^2]')
ylabel('cost [US dollar]')

%[x,fval] = patternsearch(fun,x0,[],[],[],[],lb,ub);
S = 418;
A = 7:0.2:9;
lamda = 0.15;
Sweep_LE = 35;

for i = 1:length(A)
    InputFile
    [t0, w0, wf] = T0_iteration( 0.25, W0_guess ,S,1,A(i),lamda,Sweep_LE);
    cost2(i) = COC(t0, w0, wf);
%     if (t0 >   9.72e+05)
%         cost2(i) = 0;
%     end
end
figure(2)
plot(A,cost2,'LineWidth',2)
xlabel('Aspect Ratio')
ylabel('cost [US dollar]')

S = 418;
A = 9;
lamda = 0.15;
Sweep_LE = 25:40;

for i = 1:length(Sweep_LE)
    InputFile
    [t0, w0, wf] = T0_iteration( 0.25, W0_guess ,S,1,A,lamda,Sweep_LE(i));
    cost3(i) = COC(t0, w0, wf);
%     if (t0 >   9.72e+05)
%         cost2(i) = 0;
%     end
end
figure(3)
plot(Sweep_LE,cost3,'LineWidth',2)
xlabel('Leading Edge Sweep Angle [deg]')
ylabel('cost [US dollar]')