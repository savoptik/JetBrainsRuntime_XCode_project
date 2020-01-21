#  JetBrainsRuntime Xcode Project

Этот проект для Xcode позволяет отлаживать нативную реализацию Swing для MacOS

## Использование:
1. Клонируйте репазиторий:
    ```Bash
    $ git clone -recorsive https://github.com/savoptik/JetBrainsRuntime_XCode_project.git
    ```
1. Убедитесь, что в [скрипте](SetConfig.sh) распложение JDK соответствует тому, которое у вас. Иначе измените его.
1. ВыБерите схему запуска "SetConfiguration" и запустите сборку. XCode установит конфигурации для сборки JDK.
1. Выберите подходящую вам конфигурацию JDK из списка сборочных схем и запустите сборку. XCode отобразит ошибки и предупреждения обычным способом.

Инструкция по созданию аналогичного проекта лежит [тут](CreateProjectInstruction.md).