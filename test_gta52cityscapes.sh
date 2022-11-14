# cd AI6121_project
mkdir cyclegan/datasets/gta52cityscapes/testA
cp cyclegan/datasets/gta52cityscapes/trainA cyclegan/datasets/gta52cityscapes/testA
cp cyclegan/checkpoints/gta52cityscapes/latest_net_G_A.pth cyclegan/checkpoints/gta52cityscapes/latest_net_G.pth 
python test.py --dataroot datasets/gta52cityscapes/testA --name gta52cityscapes --model test --no_dropout
