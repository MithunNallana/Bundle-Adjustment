function [ x, alldata ] = estimateParameters( alldata, basecam1, basecam2 )
%ESTIMATEPARAMETERS Summary of this function goes here
%   Detailed explanation goes here

imagedata = alldata.imagedata;
cameradata = alldata.cameradata;
pointdata = alldata.pointdata;

% first image extrinsics are set by default.
angaxis = convertToAngleAxis(eye(3));
location = zeros(3,1);
imagedata(basecam1).extrinsics = [angaxis; location];

% fundamental matrix calculation between first and second images.
img1 = imagedata(basecam1);
img2 = imagedata(basecam2); % somthing at bottom of this part too
[pointids, ia, ib]  = intersect(img1.ptid, img2.ptid);
fts1 = [img1.x(ia)', img1.y(ia)'];
fts2 = [img2.x(ib)', img2.y(ib)'];

K1 = cameradata(imagedata(basecam1).cam).intrinsics;
camparam1 = cameraIntrinsics([K1(1,1),K1(2,2)],[K1(1,3),K1(2,3)],[1280,720]);

K2 = cameradata(imagedata(basecam2).cam).intrinsics;
camparam2 = cameraIntrinsics([K2(1,1),K2(2,2)],[K2(1,3),K2(2,3)],[1280,720]);

%struck here not knowing how E works.

[E,inliers] = estimateEssentialMatrix(fts1,fts2,camparam1);
[R,t] = relativeCameraPose(E,camparam1,camparam2,fts1(inliers,:),fts2(inliers,:));
% stupid matalb K*[R',t']
R = R';
t = t';
angaxis = convertToAngleAxis(R);
imagedata(basecam2).extrinsics = [angaxis;t];
P1 = K1*[eye(3),zeros(3,1)];
P2 = K2*[R,t];
worldpoints = triangulate(fts1,fts2,P1',P2');
for p = 1:size(worldpoints,1)
    if pointdata(pointids(p),4) == -1
        pointdata(pointids(p),1:3) = worldpoints(p,1:3);
        pointdata(pointids(p),4) = 1;
    end
end

for i = 1:size(imagedata,2)
    if isempty(imagedata(i).extrinsics)
        img1 = imagedata(basecam1);
        img2 = imagedata(i); % somthing at bottom of this part too
        [pointids, ia, ib]  = intersect(img1.ptid, img2.ptid);
        fts1 = [img1.x(ia)', img1.y(ia)'];
        fts2 = [img2.x(ib)', img2.y(ib)'];
        
        [norm_fts1, T1] = normalizePoints(fts1);
        [norm_fts2, T2] = normalizePoints(fts2);
        
        [norm_F, inliers] = estimateFundamentalMatrixRANSAC(norm_fts1, norm_fts2);
        F = T2'*norm_F*T1;
        K1 = cameradata(img1.cam).intrinsics;
        K2 = cameradata(img2.cam).intrinsics;
        E = K2'*F*K1;
        [u, d, v] = svd(E);
        newd = diag([(d(1,1)+d(2,2))/2, (d(1,1)+d(2,2))/2 , 0]);
        E = u * newd * v' ;
        [R, t] = decomposeEssentialMatrix(E,fts1(inliers,:), fts2(inliers,:), K1, K2);
        angaxis = convertToAngleAxis(R);
        imagedata(i).extrinsics = [angaxis;t];
        P1 = K1*[eye(3),zeros(3,1)];
        P2 = K2*[R,t];
        worldpoints = estimate3DPointsAlgebraic(fts1, fts2, P1, P2);
        for p = 1:size(worldpoints,1)
            if pointdata(pointids(p),4) == -1
                pointdata(pointids(p),1:3) = worldpoints(p,1:3);
                pointdata(pointids(p),4) = 1;
            end
        end
    end
end

for i = 1:size(imagedata,2)
    for j = i+1:size(imagedata,2)
        img1 = imagedata(i);
        img2 = imagedata(j);
        [pointids, ia, ib]  = intersect(img1.ptid, img2.ptid);
        counter = sum(pointdata(pointids,4)==-1*ones(size(pointids,2),1));
        if counter > 0
            fts1 = [img1.x(ia)', img1.y(ia)'];
            fts2 = [img2.x(ib)', img2.y(ib)'];
            K1 = cameradata(img1.cam).intrinsics;
            K2 = cameradata(img2.cam).intrinsics;
            P1 = K1*[convertToRotationMatrix(img1.extrinsics(1:3)),img1.extrinsics(4:6)];
            P2 = K2*[convertToRotationMatrix(img2.extrinsics(1:3)),img2.extrinsics(4:6)];
            worldpoints = estimate3DPointsAlgebraic(fts1, fts2, P1, P2);
            for p = 1:size(worldpoints,1)
                if pointdata(pointids(p),4) == -1;
                    pointdata(pointids(p),1:3) = worldpoints(p,1:3);
                    pointdata(pointids(p),4) = 1;
                end
            end
        end
        
    end
end

x = [];
for i = 1:size(imagedata,2)
    x = [x; imagedata(i).extrinsics];
end

for i = 1:size(pointdata,1)
    if pointdata(i,4) ~= -1;
        x = [x; pointdata(i,1:3)'];
    end
end

alldata.imagedata = imagedata;
alldata.cameradata = cameradata;
alldata.pointdata = pointdata;
