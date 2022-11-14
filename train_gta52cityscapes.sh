# cd AI6121_project
mkdir cyclegan/datasets/gta52cityscapes
cp GTA5_images cyclegan/datasets/gta52scapes/trainA
cp Cityscapes_images/*/*/*/*.png cyclegan/datasets/gta52scapes/trainB/
python cyclegan/train.py --dataroot ./cyclegan/datasets/gta52scapes --name gta52scapes --model cycle_gan --display_id -1
