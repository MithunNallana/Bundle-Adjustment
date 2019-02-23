function hess_y_pt_pt = computeHessianYPointPoint(point, cameraparams)
%COMPUTEHESSIANYPOINTPOINT
%    HESS_Y_PT_PT = COMPUTEHESSIANYPOINTPOINT(X,Y,Z,FY,TY,TZ,WX,WY,WZ,Y0)

%    This function was generated by the Symbolic Math Toolbox version 8.0.
%    01-Dec-2018 12:28:58

X = point(1);
Y = point(2);
Z = point(3);
fx = cameraparams(1);
fy = cameraparams(2);
x0 = cameraparams(3);
y0 = cameraparams(4);
wx = cameraparams(5);
wy = cameraparams(6);
wz = cameraparams(7);
tx = cameraparams(8);
ty = cameraparams(9);
tz = cameraparams(10);

if (0.0 < wx.^2+wy.^2+wz.^2)
    t0 = (fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2.*2.0+(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).^2.*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t0 = 0.0;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t1 = -(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2+(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t1 = 0.0;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t2 = (y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t2 = 0.0;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t3 = -(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2+(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t3 = 0.0;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t4 = (fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2.*-2.0+(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).^2.*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t4 = 0.0;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t5 = -(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2+(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t5 = -fy.*1.0./(Z+tz).^2;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t6 = (y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t6 = 0.0;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t7 = -(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2-(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2+(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t7 = -fy.*1.0./(Z+tz).^2;
end
if (0.0 < wx.^2+wy.^2+wz.^2)
    t8 = (y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^2.*-2.0+((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0).^2.*1.0./(tz+Z.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-X.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))+Y.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))).^3.*(fy.*ty+X.*(fy.*(wz.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wx.*wy.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2))-y0.*(wy.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wx.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+tz.*y0+Y.*(fy.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wz.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)+y0.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)-(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))+Z.*(y0.*((wx.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+(wy.^2.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)+1.0)-fy.*(wx.*sin(sqrt(wx.^2+wy.^2+wz.^2)).*1.0./sqrt(wx.^2+wy.^2+wz.^2)+(wy.*wz.*(cos(sqrt(wx.^2+wy.^2+wz.^2))-1.0))./(wx.^2+wy.^2+wz.^2)))).*2.0;
else
    t8 = 1.0./(Z+tz).^3.*(Y.*fy+Z.*y0+fy.*ty+tz.*y0).*2.0-y0.*1.0./(Z+tz).^2.*2.0;
end
hess_y_pt_pt = reshape([t0,t1,t2,t3,t4,t5,t6,t7,t8],[3,3]);
