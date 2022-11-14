# AI6121_project

The project uses PyTorch implementations of CycleGAN to achieve semantic segmentation and input space unsupervised domain adaptation for the course project AI6121. 

Please use the following command to clone this repo:

```bash
git clone --recursive https://github.com/YuYue525/AI6121_project.git
cd AI6121_project/cyclegan
```

## Environment Initialization

For pip users, please type the command
```bash
pip install -r requirements.txt
```
For Conda users, you can create a new Conda environment using 
```bash
conda env create -f environment.yml
```

## Download Dataset

Please download all the datasets from [OneDrive](https://entuedu-my.sharepoint.com/:f:/g/personal/yyu025_e_ntu_edu_sg/EmZ1HCaxrEJEkaRSwtKrI_sBnZpuwcu4Pq-tT0mvFMu0VQ?e=QqpbFq) just for convenience, or you can refer to the following websites:
- [Cityscapes](https://www.cityscapes-dataset.com/)
- [GTA5](https://download.visinf.tu-darmstadt.de/data/from_games/)

Under the folder `AI6121_project`, please unzip the downloaded files as follows:

```bash
# cd AI6121_project

unzip 01_images.zip -d GTA5_images
unzip 02_images.zip -d GTA5_images

unzip 01_labels.zip -d GTA5_labels
unzip 02_labels.zip -d GTA5_labels

unzip 03_images.zip -d GTA5_val_images
unzip 03_labels.zip -d GTA5_val_labels

unzip leftImg8bit_trainvaltest.zip -d Cityscapes_images
unzip gtFine_trainvaltest.zip -d Cityscapes_labels
```
Or you can use unzip_datasets.sh:

```bash
# cd AI6121_project
bash unzip_datasets.sh
```

## Model Training/Testinng

Under the folder `AI6121_project`, to train a CycleGAN on GTA5 dataset to its label dataset:
```bash
# cd AI6121_project
mkdir cyclegan/datasets/gta5
cp GTA5_images cyclegan/datasets/gta5/trainA
cp GTA5_labels cyclegan/datasets/gta5/trainB
python cyclegan/train.py --dataroot ./cyclegan/datasets/gta5 --name gta5 --model cycle_gan --display_id -1
```
Or you can use train_gta5.sh:

```bash
# cd AI6121_project
bash train_gta5.sh
```

To test on Cityscapes dataset:
```bash
# cd AI6121_project
mkdir cyclegan/datasets/gta5/testA
cp Cityscapes_images/*/*/*/*.png cyclegan/datasets/gta5/testA/
cp cyclegan/checkpoints/gta5/latest_net_G_A.pth cyclegan/checkpoints/gta5/latest_net_G.pth 
python test.py --dataroot datasets/gta5/testA --name gta5 --model test --no_dropout
```

Or you can use test_gta5.sh:

```bash
# cd AI6121_project
bash test_gta5.sh
```
The generated results are under `./cyclegan/results/`.

To validate other datasets, please replace the images under the folder `cyclegan/datasets/gta5/testA` and run the same command as above. Similarly, to train the other CycleGAN model by using different datasets, please create the folder `cyclegan/datasets/[your test]` and move the datasets to `cyclegan/datasets/[your test]/trainA` and `cyclegan/datasets/[your test]/trainB`. Another UDA example:


Under the folder `AI6121_project`, to train a CycleGAN on GTA5 dataset to Cityscapes style:
```bash
# cd AI6121_project
mkdir cyclegan/datasets/gta52cityscapes
cp GTA5_images cyclegan/datasets/gta52scapes/trainA
cp Cityscapes_images/*/*/*/*.png cyclegan/datasets/gta52scapes/trainB/
python cyclegan/train.py --dataroot ./cyclegan/datasets/gta52scapes --name gta52scapes --model cycle_gan --display_id -1
```

Or you can use train_gta52cityscapes.sh:

```bash
# cd AI6121_project
bash train_gta52cityscapes.sh
```

To test on GTA5 dataset:
```bash
# cd AI6121_project
mkdir cyclegan/datasets/gta52cityscapes/testA
cp cyclegan/datasets/gta52cityscapes/trainA cyclegan/datasets/gta52cityscapes/testA
cp cyclegan/checkpoints/gta52cityscapes/latest_net_G_A.pth cyclegan/checkpoints/gta52cityscapes/latest_net_G.pth 
python test.py --dataroot datasets/gta52cityscapes/testA --name gta52cityscapes --model test --no_dropout
```

Or you can use test_gta52cityscapes.sh:

```bash
# cd AI6121_project
bash test_gta52cityscapes.sh
```
The generated results are under `./cyclegan/results/`.

Similar to other experiments, please read our project report for more information.


## Citation

Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks.<br>
[Jun-Yan Zhu](https://www.cs.cmu.edu/~junyanz/)\*,  [Taesung Park](https://taesung.me/)\*, [Phillip Isola](https://people.eecs.berkeley.edu/~isola/), [Alexei A. Efros](https://people.eecs.berkeley.edu/~efros). In ICCV 2017. (* equal contributions) [[Bibtex]](https://junyanz.github.io/CycleGAN/CycleGAN.txt)

Image-to-Image Translation with Conditional Adversarial Networks.<br>
[Phillip Isola](https://people.eecs.berkeley.edu/~isola), [Jun-Yan Zhu](https://www.cs.cmu.edu/~junyanz/), [Tinghui Zhou](https://people.eecs.berkeley.edu/~tinghuiz), [Alexei A. Efros](https://people.eecs.berkeley.edu/~efros). In CVPR 2017. [[Bibtex]](https://www.cs.cmu.edu/~junyanz/projects/pix2pix/pix2pix.bib)
