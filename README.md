# wsl-win10-lockpic2x-autosave

Auto save Windows10 lock screen backgroud picture@2x

## Require

- imagemagick
- waifu2x

## Setup


```
sudo apt-get update
sudo apt-get install imagemagick
sudo apt-get install gcc cmake opencl-headers libopencv-dev
git clone "https://github.com/DeadSix27/waifu2x-converter-cpp"
cd waifu2x-converter-cpp/
mkdir out && cd out
cmake ..
make -j6
sudo make install
sudo ldconfig
```

waifu2x uses CPU because GPU is not visible to WSL.

## Windows Time Scheduler

The lock screen image is downloaded at startup. Therefore, set it to the time you are running.


```run.bat
@echo off
wsl /bin/bash /home/username/win10-lockpic-autosave/autosave.sh
```

## 参考

- [Windows 10のロック画面に表示される「気に入りましたか？」の写真を保存する \| できるネット](https://dekiru.net/article/14136/)
- [第586回　waifu2xで画像をきれいに拡大する：Ubuntu Weekly Recipe｜gihyo\.jp … 技術評論社](https://gihyo.jp/admin/serial/01/ubuntu-recipe/0586)

