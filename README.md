# Bundle Adjustment

This code can be used to benchmark different optimizers for bundle adjustment.

## Before getting started:
Here we use colmap to generate inital set of correspondences among multiple images. The process to genearte dataset.mat is as follows:

1. Start colmap and using File -> New project
2. Create a new Database and select location of images. (sort images into folders based on camera) then save it.
3. Next in Processing -> Feature extraction, select "PINHOLE" and select "shared per sub-folder" for camera parameters.
4. Click on extract.
5. Once features are extracted, use Processing -> Feature matching to match feature among images. (This takes a lot of time on pc).
6. Once feature matching is completed, use File -> Export model as text to save feature mathches. (into */prereq* folder)
7. Three files namely "camera.txt", "images.txt" and "points3D.txt" are saved during this export.
8. Now move to */prereq* and run image_data_loader.m to load data to mat file.
9. Next run image_name_assign.m to load names to mat file.
10. Next run image_color_loader.m to load feature colors to a color mat file.

Following above steps results in two files namely "dataset_color.mat" and "dataset_small.mat"

copy these files into */* (project source folder).   

Then use launch to run parameter estimation problem and bundle adjustment problem.

In this repository, we have implemented two BA optimization techniques:
1. Lavenberg
2. Levenberg-Marquardt
3. vinila-gradient
4. Newton (still there is a problem of gauage freedom)

References:
[1] Triggs, B., McLauchlan, P. F., Hartley, R. I., & Fitzgibbon, A. W. (1999, September). Bundle adjustment—a modern synthesis. In International workshop on vision algorithms (pp. 298-372). Springer, Berlin, Heidelberg.
[2] Hartley, R., & Zisserman, A. (2003). Multiple view geometry in computer vision. Cambridge university press.

run:
on pc: launch.m
on slurm based server: sbatch run_launch.sh 

