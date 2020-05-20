Asm68k.exe /p  hack_test.asm, Build\ghouls_hack.bin

java -jar RomMangler.jar split ghouls_split.cfg Build\ghouls_hack.bin
