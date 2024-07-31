::init.bat
::bochs的安裝目录
set BXSHARE=H:\usr\Bochs-2.7
::代码的目录
set rootPath=H:\pojo\systeam-code\mySystem
set hdPath=%rootPath%/hd/main.hd
set mbrBinPath=%rootPath%/build/mbr.bin
set loaderBinPath=%rootPath%/build/loader.bin

mkdir "%rootPath%/hd"
mkdir "%rootPath%/build"
::创建虚拟硬盘main.hd\n
if not exist "%hdPath%" bximage  -func="create" -hd="60M" -imgmode="flat" -q "%hdPath%"
::编译MBR程序
nasm -o "%mbrBinPath%" -I "%rootPath%/boot/include" "%rootPath%/boot/mbr.S"
::编译LOADER程序
nasm -o "%loaderBinPath%" -I "%rootPath%/boot/include" "%rootPath%/boot/loader.S"
::写入MBR程序
dd if="%mbrBinPath%" of="%hdPath%" bs=512 count=1 seek=0 conv=notrunc
::写入LOADER程序
dd if="%loaderBinPath%" of="%hdPath%" bs=512 count=1 seek=2 conv=notrunc
bochs -f .\config\bochs.disk
