echo -on
mode 80,25

;locate correct drive
cls
if exist .\flash.nsh then
  goto FLASH
endif
if exist fs0:\AfuEfix64.efi then
  fs0:
  echo Found Flash Package on fs0:
  goto FLASH
endif
if exist fs1:\AfuEfix64.efi then
  fs1:
  echo Found Flash Package on fs1:
  goto FLASH
endif
if exist fs2:\AfuEfix64.efi then
  fs2:
  echo Found Flash Package on fs2:
  goto FLASH
endif
if exist fs3:\AfuEfix64.efi then
  fs3:
  echo Found Flash Package on fs3:
  goto FLASH
endif
if exist fs4:\AfuEfix64.efi then
  fs4:
  echo Found Flash Package on fs4:
  goto FLASH
endif
if exist fs5:\AFU\AfuEfix64.efi then
  fs5:
  echo Found Flash Package on fs5:
  goto FLASH
endif

:FLASH
cd \
echo -on

if exist .\IMAGEM1U.rom then 
   goto AFUFLASH
endif

if exist \IMAGEM1U.bin then 
   goto ROOTFLASH
endif

echo Could not find BIOS update file
goto END

:ROOTFLASH
flash2.efi imagem1u.bin /bb /rsmb
goto END

:AFUFLASH
flash2.efi imagem1u.rom /bb /rsmb
goto END

:END