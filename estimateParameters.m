function [ x, xids, nimgs, npts ] = estimateParameters( alldata, basecam1, basecam2, imwidth, imheight )
%ESTIMATEPARAMETERS Summary of this function goes here
%   Detailed explanation goes here

imagedata = alldata.imagedata;
cameradata = alldata.cameradata;
pointdata = alldata.pointdata;

nimgs = size(imagedata,2);

angaxis = convertToAngleAxis(eye(3));
location = zeros(3,1);
imagedata(basecam1).extrinsics = [angaxis; location];

img1 = imagedata(basecam1);
img2 = imagedata(basecam2); % somthing at bottom of this part too
[pointids, ia, ib]  = intersect(img1.ptid, img2.ptid);
fts1 = [img1.x(ia)', img1.y(ia)'];
fts2 = [img2.x(ib)', img2.y(ib)'];

K1 = cameradata(imagedata(basecam1).cam).intrinsics;
camparam1 = cameraIntrinsics([K1(1,1),K1(2,2)],[K1(1,3),K1(2,3)],[imwidth,imheight]);

K2 = cameradata(imagedata(basecam2).cam).intrinsics;
camparam2 = cameraIntrinsics([K2(1,1),K2(2,2)],[K2(1,3),K2(2,3)],[imwidth,imheight]);

% matlab inbuilt bug
[E,inliers] = estimateEssentialMatrix(fts1,fts2,camparam1,camparam2,'MaxNumTrials',1000000);
[R,t] = relativeCameraPose(E,camparam1,camparam2,fts1(inliers,:),fts2(inliers,:));
% stupid matalb in their desire to conquer the world of computer vision
t = -R*t';
angaxis = convertToAngleAxis(R);
imagedata(basecam2).extrinsics = [angaxis;t];
P1 = K1*[eye(3),zeros(3,1)];
P2 = K2*[R,t];

worldpoints = triangulate(fts1,fts2,P1',P2');
for p = 1:size(worldpoints,1)
    pointdata(pointids(p),1:3) = worldpoints(p,1:3);
    pointdata(pointids(p),4) = 1;
end

imagecount = 2;

while(imagecount < nimgs)
    totalids = (1:size(pointdata,1))';
    filledids = totalids(pointdata(:,4)==1);
    
    temp_counter = -1;
    temp_index = -1;
    for u = 1:nimgs
        if isempty(imagedata(u).extrinsics)
            img = imagedata(u);
            [pointids, ~, ~]  = intersect(img.ptid', filledids);
            if (temp_counter < size(pointids,1))
                temp_counter = size(pointids,1);
                temp_index = u;
            end
            
        end
    end
    
    i = temp_index;
    disp(['Camera ', num2str(i), '  is being located']);
    
    
    if isempty(imagedata(i).extrinsics)
        
        img = imagedata(i);
        K = cameradata(imagedata(i).cam).intrinsics;
        camparam = cameraIntrinsics([K(1,1),K(2,2)],[K(1,3),K(2,3)],[imwidth,imheight]);
        [pointids, ia, ~]  = intersect(img.ptid', filledids);
        fts = [img.x(ia)', img.y(ia)'];
        pts = pointdata(pointids,1:3);
        [R,t] = estimateWorldCameraPose(fts,pts,camparam, 'MaxNumTrials', 100000 );
        t = -R*t';
        angaxis = convertToAngleAxis(R);
        imagedata(i).extrinsics = [angaxis;t];
    end
    
    prevfilledids = size(filledids,1);
    A = [];
    for p = 1:nimgs
        if isempty(imagedata(p).extrinsics)
            % do nothing
        else
            A = unique([A;imagedata(p).ptid']);
        end
    end
    curfilledids = size(A,1);
    totalids(filledids) = [];
    % stupid loop due to matlab bug
    
    
    if curfilledids > prevfilledids
        for m = 1:nimgs
            if (~isempty(imagedata(m).extrinsics))
                for n = m+1:nimgs
                    if(~isempty(imagedata(n).extrinsics))
                        
                        img1 = imagedata(m);
                        img2 = imagedata(n); 
                        [pointids, ia, ib]  = intersect(img1.ptid, img2.ptid);
                        fts1 = [img1.x(ia)', img1.y(ia)'];
                        fts2 = [img2.x(ib)', img2.y(ib)'];
                        [pointids,ia,~] = intersect(pointids',totalids);
                        fts1 = fts1(ia,:);
                        fts2 = fts2(ia,:);
                        if (size(fts1,1) == 0 )
                            continue;
                        end
                        K1 = cameradata(imagedata(m).cam).intrinsics;
                        K2 = cameradata(imagedata(n).cam).intrinsics;
                        e1 = imagedata(m).extrinsics;
                        e2 = imagedata(n).extrinsics;
                        R1 = convertToRotationMatrix(e1(1:3));
                        R2 = convertToRotationMatrix(e2(1:3));
                        P1 = K1*[R1,e1(4:6)];
                        P2 = K2*[R2,e2(4:6)];
                        worldpoints = triangulate(fts1,fts2,P1',P2');
                        for p = 1:size(worldpoints,1)
                            pointdata(pointids(p),1:3) = worldpoints(p,1:3);
                            pointdata(pointids(p),4) = 1;
                        end
                    end
                end
            end
        end
    end
    imagecount = imagecount + 1;
end


npts = sum(pointdata(:,4)==1);
x = zeros(6*nimgs+3*npts,1);
xids = zeros(nimgs+npts,1);

for i = 1:nimgs
    x(6*(i-1)+1:6*(i),1) = imagedata(i).extrinsics;
    xids(i,1) = imagedata(i).cam;
end

count = 1;
for i = 1:size(pointdata,1)
    if pointdata(i,4) ~= -1
        x(6*nimgs+3*(count-1)+1:6*nimgs+3*count,1) = pointdata(i,1:3)';
        xids(nimgs+count,1) = i;
        count = count + 1;
    end
end

npts = size(pointdata,1);
