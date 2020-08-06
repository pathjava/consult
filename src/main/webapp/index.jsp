<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .layer1 {
            float: right; /* Обтекание по правому краю */
            background: #e6f5ef; /* Цвет фона */
            border: 1px solid black; /* Параметры рамки */
            padding: 10px; /* Поля вокруг текста */
            margin-right: 20px; /* Отступ справа */
            width: 25%; /* Ширина блока */
        }
    </style>
</head>
<body>
<h2>Hello World! 123 Привет</h2>
<div class="layer1">
    <ol>
        <li id = 'li1'>Строка <b>1</b></li>
        <li>Строка 2</li>
        <li>Строка 3</li>
        <li>Строка 4</li>
        <li>Строка 5</li>
    </ol>
</div>
<div class="layer1">
    <ol>
        <li id = 'li2'>Строка <b>1</b></li>
        <li>Строка 2</li>
        <li>Строка 3</li>
        <li>Строка 4</li>
        <li>Строка 15</li>
    </ol>
</div>
<div>
    <img src="images/progwards_bw.png" alt="Логотип">
</div>
<form>
    <label for="name">Введите имя</label>
    <input id="name" title="123" type="text">
    <br>
    <label for="date">Введите имя</label>
    <input id="date" title="456" type="date">
    <br>
    <label for="name">Введите имя</label>
    <input id="select" title="789" type="checkbox">

    <input type="submit" class="btn btn-lg btn-primary" value="Сохранить" />
</form>
</body>
</html>
