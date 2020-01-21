#  Как создать проект XCode для сборки и правки кода JDK
В этой статье

1. [Сборка JDK](#Сборка-JDK)
1. [Добавление autoComplitions](#Добавление-autoComplitions)

Как мне известно, на Mac нет удобного способа редактировать нативный код JDK, все известные мне способы не предполагают ни автоматической сборки по нажатию одной кнопки или сочетания клавиш, ни так же не работает автодополнение.

Раз способа нет, надо его изобрести.

---

С начала я задался вопросом как собирать JDK из XCODE, это не сложно.

## Сборка JDK

1. Запустите XCode и создайте новый проект
1. Выберите платформу "Cross-platform" и шаблон "External Build System"
1. На следующем шаге введите название проекта и в поле "Build Tool" укажите "/usr/bin/make" без кавычек
Клонируйте JDK в папку с проектом или создайте в папке с проектом символическую ссылку на папку, в которой лежат сорцы JDK
    ```Bash
    $ ln -s /path/to/source/dir/ /path/to/project/dir/
    ```
1. В настройках проекта для таргета с именем проекта укажите в поле "Arguments" аргументы для сборки
    Если задана одна конфигурация и сборка запускается из консоли
    ~~~Bath
    $ make images
    ```
    То в поле оргументов указываем только "images""
1. А в поле "Directory" папку с JBR к примеру так: "./JetBrainsRuntime/" без кавычек

После запуска Xcode соберёт JDK и выведет ошибки и предупреждения в разделе ишьюс.

### Внимание

Не забудьте перед запуском сборки убедиться, что для make задана заказанная вами конфигурация.

## Добавление autoComplitions

1. Добавьте в проект новый таргет, выберите платформу "Mac" и шаблон "Command Line Tool", задайте ему имя, например "autocomplition" и выберите для него язык "Objective-C".
1. Xcode создаст файл MAin и прочие группы и подпапки, которые необходимо удалить, а так же в редакторе схем удалить схему с названием autocomplition.
1. После этого добавьте в проект необходимые вам сорцы только при добавлении убедитесь, что тобавляете их в таргет autocomplition
1. А так же убедитесь, что Xcode создаст группу, а не добавит в проект ссылку на папку с сорцами.

После этого заработает автодополнение.