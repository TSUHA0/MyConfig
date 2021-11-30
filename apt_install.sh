#this is sh applicable to ubuntu 20.04 


#utils
echo "------- Installing utils package -------"
apt install curl net-tools proxychains zsh vim \
	make cmake \
	ranger 

# if you want preview file when your user is 'root'
# you need to find 'ranger/core/main.py'
# run cmd :
# 	find / -path "/mnt/*" -prune -o -name "ranger"
# if there is wrong, just run:
#	find / -name "ranger"
# and select which path include "site-packages"
# my path is /usr/lib/python3/dist-packages/ranger/core/main.py
# edit this file. find where :
#	  if fm.username == 'root':
#            fm.settings.preview_files = False
#            fm.settings.use_preview_script = False
#            LOG.info("Running as root, disabling the file previews.") 
#
# and add '#' at the beginning of each line, changed to like this:
#
#	  #if fm.username == 'root':
#         #   fm.settings.preview_files = False
#         #   fm.settings.use_preview_script = False
#         #   LOG.info("Running as root, disabling the file previews.")
# then you will preview file as root

echo "------- Installed utils package -------"


#c/c++
echo "------- Installing c/c++ package -------"
apt install gcc clang ccls
echo "------- Installed c/c++ package -------"
