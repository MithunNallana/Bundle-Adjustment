
for i = 1:size(imagedata,2)
    if isempty(imagedata(i).extrinsics)
        
        idx = pointdata(:,4) == 1;
        filledids = (1:size(pointdata,1))';
        filledids = filledids(idx);
        filledpts = pointdata(idx,:);
        
        img = imagedata(i);
        [pointids, ia, ib]  = intersect(img.ptid, filledids);
        fts = [img.x(ia)', img.y(ia)'];
        pts = filledpts(ib,:);
        
        if (size(pts,1) < 12)
            error('i failed you');
        end
        
        K = cameradata(img.cam).intrinsics;
        idx = randperm(size(pointids,1),4);
        fts_picked = fts(idx,:);
        pts_picked = pts(idx,:);
        fts_picked = [fts_picked, ones(4,1)]';
        fts_picked = K\fts_picked;
        pts_picked = pts_picked(:,1:3)';
        poses = estimatePoseP3P(pts_picked(:,1:3),fts_picked(:,1:3));
        
        pickpt = 0;
        mindist = 0;
        for k = 1:4
            t = poses(:,4*k-3);
            R = poses(:,4*k-2:4*k);
            Pmat = K*[R',-R'*t];
            mila = Pmat*pts';
            mila1 = mila(1,:)./mila(3,:);
            mila2 = mila(2,:)./mila(3,:);
            mila = [mila1; mila2]';
            dist = sum(sqrt(sum((mila-fts).^2,2)));
            disp(dist);
        end
        
        
        [R, c] = estimateWorldCameraPose(fts,pts,K);
        
        angaxis = convertToAngleAxis(R);
        imagedata(i).extrinsics = [angaxis,c];
        
        worldpoints = estimate3DPointsAlgebraic(fts1, fts2, P1, P2);
        for p = 1:size(worldpoints,1)
            if sum(pointdata(idx(p),:) == [0,0,0]) == 3;
                pointdata(idx(p),:) = worldpoints(p,1:3);
            end
        end
    end
end


x = [];
for i = 1:size(imagedata,2)
    x = [x; imagedata(i).extrinsics];
end

for i = 1:size(pointdata,2)
    if sum(pointdata(i,:) ~= [0,0,0]) == 3;
        x = [x; pointdata(i,:)'];
    end
end
    