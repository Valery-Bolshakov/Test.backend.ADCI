<?php

$text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
    et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
    culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus
    error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo
    inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.';

$new_text = $text;
if (!empty($_REQUEST['find'])) {
    $find = $_REQUEST['find']; // строка поиска
    $count_quotes = substr_count($find, '"'); //Возвращает число вхождений подстроки
    $arr_pos_quotes = []; // массив координат ковычек по строке find
    $find_without_quotes = $find; // временная строка
    $pos_quote = 0; // позиция ковычек
    $arr_quotes = [];
    $arr_without_quotes = [];
    $is_quote_first = false;

    $pattern = '/\"[^\"]*\"/'; // Регулярка для обработки Ключевой строки
    $insight_quotes_arr = [];// массив строк находящихся внутри ковычек
    preg_match_all($pattern, $find, $insight_quotes_arr);
    $insight_quotes_arr = $insight_quotes_arr[0];
    //var_dump($insight_quotes_arr);
    for ($i = 0; $i < count($insight_quotes_arr); $i++) {
        $find_without_quotes = str_replace("$insight_quotes_arr[$i]", "", "$find_without_quotes");
        // обнуляем строчные значения в ковычках и получим строку без значений в ковычках
        //echo '<br>' . $find_without_quotes, '<br>';
    }

    $find_without_quotes_arr = explode(' ', $find_without_quotes);
    for ($i = 0; $i < count($find_without_quotes_arr); $i++) {
        $new_text = str_replace("$find_without_quotes_arr[$i]", "<b>$find_without_quotes_arr[$i]</b>", "$new_text");
    }

    for ($i = 0; $i < count($insight_quotes_arr); $i++) {
        $replace_str = $insight_quotes_arr[$i];
        $replace_str = str_replace("\"", "", "$replace_str");
        //echo $replace_str, '<br>';
        $new_text = str_replace("$replace_str", "<b>$replace_str</b>", "$new_text");
    }
}
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
    Ключевая строка: <input type="text" name="find" required placeholder="Введите строку"
                            value="<?php if (!empty($_REQUEST['find'])) echo htmlspecialchars($find); ?>"> (Вводите двойные ковычки)<br><br/>
    <input type="submit" id="submit" value="Поиск">
    <hr>

</form>

<div id="text"><?php echo $new_text; ?></div>
<br><br/>

</body>
</html>

<?php


?>
