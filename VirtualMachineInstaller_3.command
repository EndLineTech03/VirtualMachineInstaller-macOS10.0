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
echo -e "\033[0;35m UNINSTALL ==> macOS 10.0 Cheetah -- PowerMac G4 \033[0m"
Sleep 1
read -p "Press enter to continue"
clear
echo -e "\033[0;31m (!!)WARNING: If you continue the Virtual Machine will be \033[0m"
echo -e "\033[0;31m (!!)deleted. \033[0m"
Sleep 1
read -p "Press enter to uninstall"
echo""
echo "Deleting the virtual machine..."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 1
cd "`dirname $0`"
mv /usr/local/opt/qemu/macos10.0.iso `dirname $0`
rm /usr/local/opt/qemu/macos10.0.img
echo "done"
Sleep 1
clear
echo "Uninstallation completed."
echo "If you want make a donation on my PayPal."
echo "Visit the page PayPall.me/albaneselorenzo"
echo ""
Sleep 1
read -p "Press enter to exit"
clear
killall Terminal