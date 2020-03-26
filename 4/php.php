<?php
/**
 * Date: 23.03.2020
 * Time: 3:25
 */
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Найти строку в тексте</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script type="text/javascript" src="jquery-3.4.1.js"></script>
    <script type="text/javascript" src="script.js"></script>
</head>
<body>
<h3><a href="http://Test.backend.ADCI/index.php">Вернуться к оглавлению</a></h3><br>

<h3>Найти строку в тексте</h3>

<form action="" method="post">
    Ключевая строка: &nbsp;<input type="text" name="name" required placeholder="Введите строку"><br><br/>
    <input type="text" hidden name="text">
    <input type="submit" id="submit" value="Поиск">
    <hr>

</form>

<div id="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
    et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
    culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus
    error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo
    inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
</div>
</body>
</html>



