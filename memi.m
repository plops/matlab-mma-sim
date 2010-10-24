% calculate in-focus image for one coherent beam

% of specified direction
% memi(phi,theta,tm,tl)
% range of angles:
% phi=-alpha,,alpha
% theta=0,,alpha
% example: vars; memi(0.alpha,rr(s)<20,rr(s)<20)

function u5 = memi(phi,theta,tm,tl)
  vars;
  k0=1/lambda;
  rx=xx(s)*D;
  ry=yy(s)*D;
  kx=k0*cos(phi)*sin(theta);
  ky=k0*sin(phi)*sin(theta);
  u0=exp(2*pi*1i.*(rx.*kx+ry.*ky)); % illumination
  % tm=rr(s)<20; % mma transmission
  u2=ft(u0.*tm); % lcos illumination
  % tl=rr(s)<20; % lcos transmission
  u4=ft(u2.*tl); % bfp illumination
  u5=ft(u4); % field (simple lens instead of microscope)
end
