# Newston-iOS
Newston — это приложение для email-newsletters, то есть статей и газет по интересам. 
Внутри приложения вас ждет выжимка лучшего контента в одном почтовом ящике, где Вы можете наслаждаться любимыми статьями. 


## Artifacts
* [design](https://www.figma.com/file/qWxMBcMHKz7uC4Zl7tmZyO/Newston-App-iOS?node-id=0%3A1)
* [product](https://omsk-community.notion.site/README-57c5024cadae48f8b167350e1eaf9a9c)


## Demo
(Дайте ему минутку на загрузиться...)

![](https://github.com/Student-Labs-2022/Newston-iOS/blob/readme/demo_gif/Newston_demo.gif)


## Build&Run
Для разработки используется стабильная версия Xcode. Для development сборки используется стандартные build settings. 


## External dependencies
С помощью Swift Package Manager необходимо установить следующие зависимости:
* библиотека Alamofire для работы с http-запросами: https://github.com/Alamofire/Alamofire
* библиотека Kingfisher для загрузки и кэширование картинок https://github.com/onevcat/Kingfisher


## Architecture and Code Quality
Проект придерживается архитектуры MVVM, для реализации которой используется фреймворк Combine. Проект разделен на несколько уровней: ядро, экраны, API и опорные файлы. Папка “Screens” содержит основные сущности приложения - Inbox, Discover, Profile, а также web-экран для чтения газет. Discover организован в несколько папок, т.к. эта сущность подразумевает наличие трех последовательных экранов.

Для автоматической проверки кода используется утилита [SwiftLint](https://github.com/realm/SwiftLint).
