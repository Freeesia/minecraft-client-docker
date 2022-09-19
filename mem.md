# GPUのメモ

## 公式ドキュメント
https://docs.nvidia.com/datacenter/cloud-native/contents.html

## UnrealEngineのコンテナ
https://unrealcontainers.com/
https://github.com/adamrehn/ue4-runtime

## Vulkanのコンテナ
https://gitlab.com/nvidia/container-images/vulkan

## Nvidiaのコンテナ
https://catalog.ngc.nvidia.com/containers

## GPUのテスト
https://linuxconfig.org/how-to-test-3d-acceleration-fps-on-ubuntu-20-04-focal-fossa
https://www.howtoforge.com/tutorial/linux-gpu-benchmark/

## 日本語のUbuntu
https://github.com/uphy/ubuntu-desktop-jp


https://7me.nobiki.com/2019/11/11/xorg-virtual-screen-with-nvidia-gpu/
https://7me.nobiki.com/2019/11/13/xorg-multiple-virtual-screen-with-nvidia-gpu/

## ドライバ
https://slackware.jp/configuration/nvidia_driver.html
http://cellspe.matrix.jp/u1004_nvidia.html
https://wiki.archlinux.jp/index.php/NVIDIA
https://atmarkit.itmedia.co.jp/flinux/rensai/linuxtips/a017nvidiaopenglerr.html
http://ossan-engineer.blogspot.com/2017/01/x11vncxvfbxdummyvirtualgl.html
https://tamnology.com/ubuntu-nvidia-driver/

## NVIDIAの日本語記事
https://medium.com/nvidiajapan/nvidia-docker-%E3%81%A3%E3%81%A6%E4%BB%8A%E3%81%A9%E3%81%86%E3%81%AA%E3%81%A3%E3%81%A6%E3%82%8B%E3%81%AE-20-09-%E7%89%88-558fae883f44

## メモ

* xvfbはGPU使えないっぽい？
  * xorg使う必要がありそう
* VirtualGL使う必要がある？
* `--gpus=all`つけるとマウントできないエラーが出る
  * たぶん、イメージ内にあるファイルをホストからマウントしようとしている
  * イメージから消せばいける？