::init.bat
::bochs�İ��bĿ¼
set BXSHARE=H:\usr\Bochs-2.7
::�����Ŀ¼
set rootPath=H:\pojo\systeam-code\mySystem
set hdPath=%rootPath%/hd/main.hd
set mbrBinPath=%rootPath%/build/mbr.bin
set loaderBinPath=%rootPath%/build/loader.bin

mkdir "%rootPath%/hd"
mkdir "%rootPath%/build"
::��������Ӳ��main.hd\n
if not exist "%hdPath%" bximage  -func="create" -hd="60M" -imgmode="flat" -q "%hdPath%"
::����MBR����
nasm -o "%mbrBinPath%" -I "%rootPath%/boot/include" "%rootPath%/boot/mbr.S"
::����LOADER����
nasm -o "%loaderBinPath%" -I "%rootPath%/boot/include" "%rootPath%/boot/loader.S"
::д��MBR����
dd if="%mbrBinPath%" of="%hdPath%" bs=512 count=1 seek=0 conv=notrunc
::д��LOADER����
dd if="%loaderBinPath%" of="%hdPath%" bs=512 count=1 seek=2 conv=notrunc
bochs -f .\config\bochs.disk
