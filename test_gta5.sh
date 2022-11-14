# cd AI6121_project
mkdir cyclegan/datasets/gta5/testA
cp Cityscapes_images/*/*/*/*.png cyclegan/datasets/gta5/testA/
cp cyclegan/checkpoints/gta5/latest_net_G_A.pth cyclegan/checkpoints/gta5/latest_net_G.pth 
python test.py --dataroot datasets/gta5/testA --name gta5 --model test --no_dropout
