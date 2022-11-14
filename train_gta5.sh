# cd AI6121_project
mkdir cyclegan/datasets/gta5
cp GTA5_images cyclegan/datasets/gta5/trainA
cp GTA5_labels cyclegan/datasets/gta5/trainB
python cyclegan/train.py --dataroot ./cyclegan/datasets/gta5 --name gta5 --model cycle_gan --display_id -1
