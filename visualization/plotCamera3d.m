function [] = plotCamera3d( R, t, camera_size, camera_tag )
%PLOTCAMERA3D plots camera given a projection matrix
%   along with x,y,z axis for refernce

if nargin < 3
    camera_size = 1;
end

if nargin < 4
    camera_tag = 'Cam 1';
end

pc = [0,+0.5,+0.5,-0.5,-0.5;
      0,+0.5,-0.5,-0.5,+0.5;
      0,+1,+1,+1,+1];

pc = camera_size*pc;
R = R';
t = -R*t;
pw = R*pc + repmat(t,1,5);

fill3(pw(1,[1,2,3]), pw(2,[1,2,3]), pw(3,[1,2,3]),'y','FaceAlpha',0.3);
fill3(pw(1,[1,2,5]), pw(2,[1,2,5]), pw(3,[1,2,5]),'y','FaceAlpha',0.3);
fill3(pw(1,[1,3,4]), pw(2,[1,3,4]), pw(3,[1,3,4]),'y','FaceAlpha',0.3);
fill3(pw(1,[1,4,5]), pw(2,[1,4,5]), pw(3,[1,4,5]),'y','FaceAlpha',0.3);
fill3(pw(1,[2,3,4,5]), pw(2,[2,3,4,5]), pw(3,[2,3,4,5]),'m','FaceAlpha',0.3);
cam_x = 1.5*camera_size*R(:,1);
cam_y = 1.5*camera_size*R(:,2);
cam_z = 1.5*camera_size*R(:,3);
quiver3(t(1), t(2), t(3), cam_x(1), cam_x(2), cam_x(3),'r','LineWidth',2);
quiver3(t(1), t(2), t(3), cam_y(1), cam_y(2), cam_y(3),'g','LineWidth',2);
quiver3(t(1), t(2), t(3), cam_z(1), cam_z(2), cam_z(3),'b','LineWidth',2);
text(t(1), t(2), t(3)-0.1, camera_tag);


end

