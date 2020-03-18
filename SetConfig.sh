#!/bin/sh

#  SetConfig.sh
#  JetBrainsRuntime_XCode_project
#
#  Created by Артём Семёнов on 21.01.2020.
#  Copyright © 2020 Артём Семёнов. All rights reserved.

if [ -e ./JetBrainsRuntime/README ]
then
cd ./JetBrainsRuntime/ &&
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-11.0.5.jdk/Contents/Home --disable-warnings-as-errors --enable-debug;
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-11.0.5.jdk/Contents/Home --disable-warnings-as-errors
make CONF=macosx-x86_64-normal-server-fastdebug clean
make CONF=macosx-x86_64-normal-server-release clean
else
git submodule init
git submodule update
cd ./JetBrainsRuntime/ &&
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-11.0.5.jdk/Contents/Home --disable-warnings-as-errors --enable-debug;
bash configure --with-boot-jdk=/Library/Java/JavaVirtualMachines/jdk-11.0.5.jdk/Contents/Home --disable-warnings-as-errors
make CONF=macosx-x86_64-normal-server-fastdebug clean
make CONF=macosx-x86_64-normal-server-release clean
fi

