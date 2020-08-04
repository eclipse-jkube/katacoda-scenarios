#!/bin/bash

sudo apt install default-jdk
sudo apt install maven
export JAVA_HOME=/usr/lib/jvm/default-java
echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> ~/.bashrc
source ~/.bashrc
