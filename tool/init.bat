::init.bat
::bochs�İ��bĿ¼
set BXSHARE=H:\usr\Bochs-2.7
::�����Ŀ¼
set rootPath=H:\pojo\systeam-code\mySystem
set hdPath=%rootPath%/hd/main.hd
set mbrBinPath=%rootPath%/build/mbr.bin

mkdir "%rootPath%/hd"
::��������Ӳ��main.hd\n
if not exist "%hdPath%" bximage  -func="create" -hd="60M" -imgmode="flat" -q "%hdPath%"
::����MBR����
nasm -o "%mbrBinPath%" "%rootPath%/mbr.S"
::д��MBR����
dd if="%mbrBinPath%" of="%hdPath%" bs=512 count=1 conv=notrunc
bochs -f .\config\bochs.disk
