#!/bin/bash
clear
echo "Starting the script..."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 1
clear
echo -e "\033[0;35m 🧠 VirtualMachineInstaller for Intel mac -- version 1.0 \033[0m"
Sleep 0.2
echo "Copyright (c) 2020-2021 EndLineTech03 (Albanese Lorenzo)"
echo "Thanks to QEMU Project developers"
echo ""
Sleep 1
echo -e "\033[0;35m RUN ==> macOS 10.0 Cheetah -- PowerMac G4 \033[0m"
Sleep 1
read -p "Press enter to continue"
clear
cd /usr/local/opt/qemu
qemu-system-ppc -machine accel=tcg -L pc-bios -boot c -M mac99,via=cuda -m 512 \
-prom-env 'auto-boot?=true' -prom-env 'vga-ndrv?=true' \
-drive file=macos10.0.img,format=raw,media=disk \
-netdev user,id=network01 -device sungem,netdev=network01 \
-device VGA,edid=on \