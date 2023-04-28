::init.bat
::bochs的安裝目录
set BXSHARE=H:\usr\Bochs-2.7
::代码的目录
set rootPath=H:\pojo\systeam-code\mySystem
set hdPath=%rootPath%/hd/main.hd
set mbrBinPath=%rootPath%/build/mbr.bin

mkdir "%rootPath%/hd"
::创建虚拟硬盘main.hd\n
if not exist "%hdPath%" bximage  -func="create" -hd="60M" -imgmode="flat" -q "%hdPath%"
::编译MBR程序
nasm -o "%mbrBinPath%" "%rootPath%/mbr.S"
::写入MBR程序
dd if="%mbrBinPath%" of="%hdPath%" bs=512 count=1 conv=notrunc
bochs -f .\config\bochs.disk
