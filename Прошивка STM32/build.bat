@echo off
rem build firmware: arm-none-eabi-gcc ?? C:\Users\genas\tools
set GCC=C:\Users\genas\tools\arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi\bin
set CF=-mcpu=cortex-m3 -mthumb -O1 -gdwarf-2 -gstrict-dwarf -Wall -ffunction-sections -fdata-sections -Iinc -finput-charset=cp1251
"%GCC%\arm-none-eabi-gcc" %CF% -nostartfiles -Wl,--gc-sections -T stm32f103c8.ld -o lab2.elf main.c startup.c -Wl,-Map=lab2.map || exit /b 1
"%GCC%\arm-none-eabi-objcopy" -O ihex lab2.elf lab2.hex
"%GCC%\arm-none-eabi-size" lab2.elf
