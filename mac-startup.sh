#!/bin/sh

# $1 text
function colorTitle () {
    echo '\033[36m '$1' \033[0m'
}

function colorSubTitle () {
    echo '\033[32m '$1' \033[0m'    
}

function cmdExist () {
    command -v $1 > /dev/null 2>&1 : true - false
}

echo "\033[31m Before runing this script \n please make sure the Xcode and Xcode Command Line Tool has been installed  \033[0m"
echo "Please input your password:"
sudo echo 'login success' 

echo "Allow install software from unknown source"
sudo spctl --master-disable

colorTitle "step 1.install homebrew"
if cmdExist brew; then 
    echo 'brew is already there'    
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
    # replace brew.git source for faster download in china
    cd "$(brew --repo)"
    git remote set-url origin https://mirrors.ustc.edu.cn/brew.git

    # replace homebrew-core.git source for faster download in china
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
fi

colorTitle "step 2.install wget"
if cmdExist wget; then 
    echo 'wget is already installed'        
else
    brew install wget
fi

colorTitle "step 3.install zsh"
if cmdExist zsh; then 
    echo 'zsh is already installed'        
else
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

colorTitle "step 4.install google chrome"
brew cask install google-chrome

colorTitle "step 5.install Node.js"
colorSubTitle " - install n"
if cmdExist zsh; then 
    echo 'n is already installed'        
else
    curl -L https://git.io/n-install | bash
fi

colorSubTitle " - install Node.js v6.11.5"
n 6.11.5

colorSubTitle " - set npm source"
npm config set registry https://registry.npm.taobao.org

colorSubTitle " - install yarn"
npm i -g yarn

colorSubTitle " -set yarn source"
yarn config set registry https://registry.npm.taobao.org

colorTitle "step 6.install java"
brew cask install caskroom/versions/java8

colorTitle "step 7.install cocoapods"
colorSubTitle " - install ruby"
if cmdExist ruby; then 
    echo 'ruby is already installed'        
else
    brew install ruby
fi
colorSubTitle " - install cocoapods"
if cmdExist pod; then 
    echo 'pod is already installed'        
else
    sudo gem install cocoapods
fi

colorTitle "step 8.install maven"
if cmdExist maven; then 
    echo 'maven is already installed'        
else
    brew install maven
fi

colorTitle "step 9.install gradle"
if cmdExist gradle; then 
    echo 'gradle is already installed'        
else
    brew install gradle
fi

colorTitle "step 10.install android-sdk"
brew cask install android-sdk

colorTitle "step 11.export android env path"

if [ !`env | grep ANDROID_HOME` ]; then
echo 'export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/26.0.2:$PATH # replace 26.0.2 as your build-tools ver.' >> ~/.zshrc
source ~/.zshrc
fi

colorTitle "step 12.install cordova"
yarn global add cordova@5.0.0

colorTitle "step 13.install react-native-cli"
yarn global add react-native-cli

colorTitle "step 14.install other tools"
colorSubTitle " -install iterm2"
brew cask install iterm2

colorSubTitle " -install shadowsocksx"
brew cask install shadowsocksx

colorSubTitle " -install fanyi"
yarn global add fanyi

colorSubTitle " -install toilet"
yarn global add toilet

colorSubTitle " -install ios-deploy"
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer/
sudo yarn global add ios-deploy

colorSubTitle " -install rhash"
brew install rhash

colorSubTitle " -install webstorm"
brew cask install webstorm

colorSubTitle " -install pycharm"
brew cask install pycharm

colorSubTitle " -install Bilibili"
brew cask install bilibili

colorSubTitle " -install Aria2GUI"
brew cask install aria2gui

colorSubTitle " -install VSCode"
brew cask install visual-studio-code

colorSubTitle " -install node-canvas"
brew install pkg-config cairo pango libpng jpeg giflib

colorTitle "step 15.install adnroid sdk tools with sdkmanager"
echo "\033[31m This step will take long time to finish, you have to be patient in waiting \033[0m"
rm -rf ~/.android
sdkmanager "add-ons;addon-google_apis-google-15" "add-ons;addon-google_apis-google-16" "add-ons;addon-google_apis-google-17" "add-ons;addon-google_apis-google-18" "add-ons;addon-google_apis-google-19" "add-ons;addon-google_apis-google-21" "add-ons;addon-google_apis-google-22" "add-ons;addon-google_apis-google-23" "add-ons;addon-google_apis-google-24" "build-tools;19.1.0" "build-tools;20.0.0" "build-tools;21.1.2" "build-tools;22.0.1" "build-tools;23.0.1" "build-tools;23.0.2" "build-tools;23.0.3" "build-tools;24.0.0" "build-tools;24.0.1" "build-tools;24.0.2" "build-tools;24.0.3" "build-tools;25.0.0" "build-tools;25.0.1" "build-tools;25.0.2" "build-tools;25.0.3" "build-tools;26.0.0" "build-tools;26.0.1" "build-tools;26.0.2" "cmake;3.6.4111459" "extras;android;m2repository" "extras;google;m2repository" "extras;google;webdriver" "lldb;2.0" "lldb;2.1" "lldb;2.2" "lldb;2.3" "ndk-bundle" "patcher;v4" "platform-tools" "platforms;android-15" "platforms;android-16" "platforms;android-17" "platforms;android-18" "platforms;android-19" "platforms;android-20" "platforms;android-21" "platforms;android-22" "platforms;android-23" "platforms;android-24" "platforms;android-25" "platforms;android-26" "tools"

echo "👏 Done!
All Packages Below Has Been Installed
    -homebrew
    -wget
    -zsh
    -java
    -chrome
    -Node.js
    -n
    -yarn
    -ruby
    -cocoapods
    -maven
    -gradle
    -android-sdk
    -cordova
    -react-native-cli
    -node-canvas
    -shadowsocksx
    -fanyi
    -toilet
    -ios-deploy
    -rhash
    -webstorm
    -pycharm
    -Bilibili
    -Aria2GUI
    -iTerm2
    -VSCode
"

echo "\033[31m WARNING: YOU MAY NEED TO CHECK THE ANDROID BUILD TOOLS VER EXPORTED IN '.zshrc' \033[0m"