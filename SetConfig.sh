#!/bin/sh

#  SetConfig.sh
#  JetBrainsRuntime_XCode_project
#
#  Created by Артём Семёнов on 21.01.2020.
#  Copyright © 2020 Артём Семёнов. All rights reserved.

if [ -e ./jdk/README.md ]
then
cd ./jdk/ &&
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home --disable-warnings-as-errors --enable-debug;
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home # --disable-warnings-as-errors
make CONF=macosx-x86_64-server-fastdebug clean
make CONF=macosx-x86_64-server-release clean
else
git submodule init
git submodule update
cd ./jdk/ &&
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home --disable-warnings-as-errors --enable-debug;
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home # --disable-warnings-as-errors
make CONF=macosx-x86_64-server-fastdebug clean
make CONF=macosx-x86_64-server-release clean
fi

