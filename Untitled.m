t=0:0.1:0.1*59;

y1=y(61:120)-y(61);
y2=y(121:180)-mean(y(117:121));
y3=y(181:240)-mean(y(175:181));
%plot(t,y1,t,y2,t,y3)
y_final=(y1+y2+y3)/3;
% figure
% plot(t,y_final)
k=mean(y_final(55:60));

%Functia de transfer 
num=k;
T=1.1;
den=[T 1];
Gps=tf(num,den);

%Discretizarea functiei de transfer
%step(Gps)
 %stepinfo(Gps) %rise_time=2.41-> [2.41/25 2.41/5]=[0.0964 0.482]
Ts=0.2;
Gpz=c2d(Gps,Ts);
[num1pz,den1pz]=tfdata(Gpz,'v')

%step(Gps, 'r', Gpz, 'g')

%Performante
zeta=0.707;
tt=2;
omega=4/(zeta*tt);

%G0(s)
s=('tf');
num0=[omega^2];
den0=[1 2*omega*zeta omega^2];
G0s=tf(num0,den0);

%G0(z)
G0z=c2d(G0s,Ts);
[num0z,den0z]=tfdata(G0z,'v')
%figure
%step(G0z);

%Gr(z)
Grz=(1/Gpz)*(G0z/(1-G0z));
[numr,denr]=tfdata(Grz, 'v');
roots(numr);
roots(denr);

Grz_simpl=minreal(Grz);
[numr_s,denr_s]=tfdata(Grz_simpl, 'v');

% Deadbeat extins

Ts2=0.4;
G0z2=c2d(G0s,Ts2);
%figure;
%step(G0s, 'r', G0z2, 'g') ;

y1_dead=0.36;
y2_dead=0.8;
y3_dead=1;
y4_dead=1.04;

p1=y1_dead;
p2=y2_dead-y1_dead;
p3=y3_dead-y2_dead;
p4=y4_dead-y3_dead;
p5=1-y4_dead;


z=tf('z',Ts2);
G0z2=(p1*z^4+p2*z^3+p3*z^2+p4*z^1+p5)/z^5;
[num0_dead,den0_dead]=tfdata(G0z2, 'v');
%figure
%step(G0z2);

Gpz2=c2d(Gps,Ts2) 
 [nump_dead,denp_dead]=tfdata(Gpz2, 'v');
%figure; step(Gps, 'r', Gpz2, 'g');


Grz2=(1/Gpz2)*(G0z2/(1-G0z2));
%[numr_2,denr_2]=tfdata(Grz2, 'v');
%roots(numr_2);s
%roots(denr_2);

Grz2_s=minreal(Grz2)
[numrs_dead,denrs_dead]=tfdata(Grz2, 'v');