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
echo "LANGUAGE: English (request more languages on the Github Official Page)."
echo "OPERATING SYSTEM YOU WILL RUN: macOS 10.0 Cheetah."
echo "COMPUTER EMULATED: PowerMac G4."
echo "REQUIREMENTS: 6GB of free storage and an internet connection."
echo "COMPLETE GUIDE: Visit the main Github page."
echo -e "\033[0;31m (!!) If you are trying to reinstall the Virtual \033[0m"
echo -e "\033[0;31m (!!) Machine (macOS 10.0), first run the third script to \033[0m"
echo -e "\033[0;31m (!!) remove and uninstall all the previous files. \033[0m"
echo ""
Sleep 1
read -p "Press enter to continue"
reqSpace=12572427
availSpace=$(df "$HOME" | awk 'NR==2 { print $4 }')
if (( availSpace < reqSpace )); then
  clear
  echo -e "\033[0;31m (X)ERROR There is a problem: you have not enough free space. \033[0m"
  Sleep 1
  echo ""
  read -p "Press enter to exit"
  echo ""
  echo "Closing al terminal windows..."
  Sleep 0.2
  echo "."
  Sleep 0.2
  echo "."
  Sleep 0.2
  echo "."
  Sleep 1
  Killall Terminal
  exit 1
fi
if test ! $(which brew); then
    clear
    echo "(!)STEP ONE: Installation of Homebrew (a package manager needed to install"
    Sleep 0.2
    echo "the software for the virtual machine, QEMU)."
    echo ""
    Sleep 1
    read -p "Press enter to continue"
    echo""
    echo "Installing Homebrew..."
    Sleep 0.2
    echo "."
    Sleep 0.2
    echo "."
    Sleep 0.2
    echo "."
    Sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "done"
    Sleep 1
    echo ""
    read -p "Press enter to continue"
fi
clear
echo "(!) Homebrew will be updated before continuing."
echo ""
Sleep 1
read -p "Press enter to continue"
echo""
echo "Updating homebrew..."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 1
brew update
echo "done"
Sleep 1
echo ""
read -p "Press enter to continue"
clear
echo "(!)STEP 2: The software that virtualize the OS (QEMU) will"
Sleep 0.2
echo "be installed. Uninstall all older versions of QEMU, if you"
echo "installed it before."
echo ""
Sleep 1
read -p "Press enter to continue"
echo""
echo "Installing latest official QEMU version..."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
echo ""
Sleep 1
brew install qemu
brew upgrade qemu
echo "done"
Sleep 1
echo ""
read -p "Press enter to continue"
clear
echo "(!) If you are interested in using QEMU in the future,"
Sleep 0.2
echo "notice that it is located in the following path:"
Sleep 0.2
Brew --prefix qemu
Sleep 1
echo ""
read -p "Press enter to continue"
clear
echo "(!)STEP 3: The Virtual Environment will be prepared for"
Sleep 0.2
echo "macOS installation that will be exactly like a physical"
Sleep 0.2
echo "Macintosh."
echo ""
Sleep 1
read -p "Press enter to continue"
echo""
echo "Setting up..."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
echo ""
Sleep 1
cd "`dirname $0`"
mv macos10.0.iso /usr/local/opt/qemu
cd /usr/local/opt/qemu
qemu-img create -f raw -o size=4G macos10.0.img 
echo "done"
Sleep 1
echo ""
read -p "Press enter to continue"
clear
echo -e "\033[0;35m (!)STEP 4: You are ready to run the Virtual Machine \033[0m"
Sleep 0.2
echo "When the installation is completed, close the Virtual Machine and the run"
Sleep 0.2
echo "the second script. Enjoy!"
echo ""
Sleep 1
read -p "Press enter to continue"
echo""
echo "Starting the Virtual Machine..."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 0.2
echo "."
Sleep 1
clear
echo "If you want, make a donation on my PayPal"
echo "www.paypal.me/albaneselorenzo"
Sleep 2
cd /usr/local/opt/qemu
reset
qemu-system-ppc -L pc-bios -boot d -M mac99,via=cuda -m 512 \
-prom-env 'auto-boot?=true' -prom-env 'boot-args=-v' -prom-env 'vga-ndrv?=true' \
-drive file=macos10.0.iso,format=raw,media=cdrom \
-drive file=macos10.0.img,format=raw,media=disk \
-netdev user,id=network01 -device sungem,netdev=network01 \
-device VGA,edid=on \