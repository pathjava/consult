# Запись на консультации

![img](https://i.imgur.com/4UKqX5K.jpg)

Страница входа в приложение: http://localhost:8888/

Страница авторизации http://localhost:8888/login

Выбор слота записи на консультацию:<br />
http://localhost:8888/consults-save?mentor=nikita <br />
http://localhost:8888/consults-save?mentor=olegOne

## Запуск приложения
Требуется Tomcat версии 7 и выше

Перед запуском для полноценного функционала приложения необходимо сгенерировать слоты записи на консультацию.

Генерация слотов выполняется в файле [ConsultsGenerator.java](https://github.com/pathjava/consult/blob/master/src/main/java/ru/progwards/advanced/business/consults/ConsultsGenerator.java)

- **В строке 46**:<br /> 
   `LocalDateTime midnight = LocalDateTime.now().with(LocalTime.MIDNIGHT).plusDays(0);`

   Ноль (0) в конце строки означает текущий день, если (1), то завтра, если (2), послезавтра и т.д.

- **В строке 58**:<br />
   `return 1;`

   Один 1 означает день недели - понедельник, 2 - вторник и т.д.

Для генерации слотов на **четверг**, при условии, что **сегодня среда**, надо в строке 46 прописать **1**, а в строке 58 прописать **4**. После этого в этом же файле запустить метод _**main**_ и в файле [consultations.json](https://github.com/pathjava/dbFiles/tree/master/src/main/resources) проекта [dbFiles](https://github.com/pathjava/dbFiles) будут сгенерированы слоты, при условии, что у одного (либо у всех) наставника в расписании на выбранный день запланированы консультации.

## Авторизация
**Менторы**:<br />
* _nikita_<br />
* _olegOne_

**Пользователи**:<br />
* _tom_<br />
* _ann_

Пароль для всех пользователей: _12345678_ 