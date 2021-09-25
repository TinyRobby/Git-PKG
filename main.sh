#!/bin/bash
set config = ""
if [ $config = "" ]
then
  echo you must enter the config option;
  sleep 2;
  echo "open the file in a text editor and find \'set config == \"\"\' to one of the allowed options(after line 14)";
  exit
 fi
set repo = $1;
set owner $2;
set source = "https://github.com/";
if [ $repo = "" ]
git clone $source$owner/$repo
cd $repo
#######################################################
if [ $config = "c++" ]
then
  mkdir build;
  cd build;
  cmake ..;
  make -j$(nproc);
  sudo make install;
  exit
fi
if [ $config = "configure-script" ]
then
  bash configure;
  exit
fi
if [ $config = "configure-script-2" ]
then
  bash config;
  exit
fi
if [ $config = "custom" ]
then
  $3
  exit
fi
if [ $config = "install" ]
then
  bash install
  exit
fi
cd ..
echo "woo hoo! it\'s done"
