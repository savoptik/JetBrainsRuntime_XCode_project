#  JetBrainsRuntime Xcode Project

This project for Xcode allows you to debug the native JDK implementation for macOS

## Building

1. Clone the repository:
    ```Bash
    $ git clone -recorsive https://github.com/savoptik/JetBrainsRuntime_XCode_project.git
    ```
1. Make sure that in [script](SetConfig.sh) the JDK mapping matches the one you have. Otherwise, change it;
1. Select the "SetConfiguration" build scheme and start the build. Xcode will set up configurations for the JDK build.
1. Select the JDK configuration that suits you from the list of build schemes, if there are no schemes, then select "add configuration" and select the build target that suits your needs;
1. Start the build. Xcode will display errors and warnings in the usual way.

### Attention

If the --recursive parameter was absent during cloning, the SetConfiguration script clones the JBR itself via HTTPS; for development, you may need to change the remote to SSH, as well as restart xcode, since xcode may decide the files are missing from disk.
Be sure to post a branch for JBR.

## Development

Add the folder with the sources you need to the "AutoComplition" build target, this will allow xcode to autocomplete the code, by default the folder ```src/java.desktop/macosx/native``` is added;

## Debugging

### Debugging with sample recompilation

There are different ways to debug the JDK code, if you want your java sempl to be recompiled every time you run, then follow the instructions below, otherwise skip to the next heading.

1. Create in xcode a new target with external build tools;
1. In the Build Tool field, specify the path, for example, to the Java compiler:
    ```
    JetBrainsRuntime/build/macosx-x86_64-normal-server-release/jdk/bin/javac
    ```
1. In the Arguments field provide the arguments for the compiler
    ```
    -d build path/to/yor/main.java
    ```
1. Check the "Pass build settings in environment" box. ";
1. Build the appropriate build scheme.

### Running and Debugging

If you created a build target, then edit its run scheme, otherwise edit the JBR debug, or JBR run scheme as follows:

1. Select "Run" from the side menu;
1. On the "info" tab, set the "Executable" executable file "java" from the JBR you just compiled;
1. On the "Arguments" tab, set be sure -cp, and the executable class;
1. Run the edited scheme.

If you checked the "Debug executable" checkbox, then java will start in LLDB, and immediately stop, then tell LLDB the following
```LLDB
[lldb] pro hand -p true -s false SIGSEGV SIGBUS
```
Then restart the execution.

The parameters can be changed, but be sure to check for operability and set the paths correctly.

#  JetBrainsRuntime проект Xcode

Этот проект для Xcode позволяет отлаживать нативную реализацию JDK для MacOS

## Сборка

1. Клонируйте репазиторий:
    ```Bash
    $ git clone -recorsive https://github.com/savoptik/JetBrainsRuntime_XCode_project.git
    ```
1. Убедитесь, что в [скрипте](SetConfig.sh) распложение JDK соответствует тому, которое у вас. Иначе измените его.
1. ВыБерите схему запуска "SetConfiguration" и запустите сборку. XCode установит конфигурации для сборки JDK.
1. Выберите подходящую вам конфигурацию JDK из списка сборочных схем, если схем нет, то выберите "добавить конфигурацию" и выберите цель сборки, соответствующую вашим потребностям;
1. Запустите сборку. XCode отобразит ошибки и предупреждения обычным способом.

### Внимание

Если при клонирование отсутствовал пораметр --recursive,скрипт SetConfiguration клонирует JBR сам по HTTPS, для разработки может понадобится изменить remote на SSH, а так же перезапустить xcode, т.к. xcode может решить, что файлы отсутствуют на диске.
Обязательно выставите ветку для JBR.

## Разработка

1. Добавьте папку с необходимыми вам исходниками в цель сборки "AutoComplition", это позволит xcode автодополнять код, по умолчанию добавлена папка ```src/java.desktop/macosx/native```;

## Отладка

### Отладка с перекомпиляцией семпла

Отлаживать код JDK можно разными способами, если вы хотите вашь java sempl перекомпилировать при каждом запуске, то следуйте инструкциям ниже, иначе переходите к следующему заголовку.

1. Создайте в xcode новую цель с внешними инструментами сборки;
1. В поле Build Tool укажите путь, к примеру, к джава компилятору:
    ```
    JetBrainsRuntime/build/macosx-x86_64-normal-server-release/jdk/bin/javac
    ```
1. В поле Arguments укажите аргументы для компилятора
    ```
    -d build path/to/yor/main.java
    ```
1. Установите флажок "Pass build settings in environment".";
1. Собирите соответствующую схему запуска.

### Запуск и отладка

Если вы создавали цель сборки, то отредактируйте её схему запуска, иначе отредактируйте схему запуска JBR debug, или JBR  следующим образом:

1. Выберите в боковом меню "Run";
1. На вкладке "info" задайте "Executable" исполняемый файл "java" из собраной вами только что JBR;
1. На вкладке "Arguments" задайте обязательно -cp, и исполняемый класс;
1. Запустите отредактированную схему.

Если вы установили флажок "Debug executable", то java запустится в LLDB, и сразу остановится, скажите тогда LLDB следующее
```LLDB
[lldb] pro hand -p true -s false SIGSEGV SIGBUS
```
После чего возабновите выполнение.

Параметры можно менять, но обязательно проверяйте на работоспособность и задавайте пути правильно.
