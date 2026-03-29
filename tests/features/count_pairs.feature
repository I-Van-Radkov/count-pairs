Feature: Поиск пар слов
    
  Scenario: расстояние 5 должно найти 1 пару
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги России 5"
    Then выводится "1"

  Scenario: расстояние 4 должно найти 0 пар
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги России 4"
    Then выводится "0"

  Scenario: расстояние 1 должно найти 2 пары
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги доходы 1"
    Then выводится "2"

  Scenario: расстояние 100 должно найти 2 пары
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги доходы 100"
    Then выводится "2"

  Scenario: неверное количество аргументов
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги России"
    Then ошибка

  Scenario: неверный формат расстояния
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги России пять"
    Then ошибка

  Scenario: отрицательное расстояние
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги России -1"
    Then ошибка

  Scenario: файл не существует
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/ne_sushestvuet.txt налоги России 5"
    Then ошибка

    Scenario: расстояние 0 должно найти пары без разделяющих слов
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги на 0"
    Then выводится "2"

  Scenario: расстояние 2 должно найти пары с 2 разделяющими словами
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги доходы 2"
    Then выводится "2"

  Scenario: расстояние 3 должно найти пары с 3 разделяющими словами
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги физических 3"
    Then выводится "2"

  Scenario: пустое первое слово
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt \"\" России 5"
    Then выводится "0"

  Scenario: пустое второе слово
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги \"\" 5"
    Then выводится "0"

  Scenario: одинаковые слова
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги налоги 5"
    Then выводится "0"

  Scenario: пустой файл
    Given подготовили тестовый файл "data/empty.txt"
    When я запускаю "go run ../cmd/app/main.go data/empty.txt налоги России 5"
    Then выводится "0"

  Scenario: файл с одним словом
    Given подготовили тестовый файл "data/one_word.txt"
    When я запускаю "go run ../cmd/app/main.go data/one_word.txt налоги России 5"
    Then выводится "0"

  Scenario: файл с двумя словами
    Given подготовили тестовый файл "data/two_words.txt"
    When я запускаю "go run ../cmd/app/main.go data/two_words.txt налоги России 0"
    Then выводится "1"

  Scenario: слова с пунктуацией в конце
    Given подготовили тестовый файл "data/punctuation.txt"
    When я запускаю "go run ../cmd/app/main.go data/punctuation.txt налоги России 5"
    Then выводится "1"

  Scenario: слова с пунктуацией в начале
    Given подготовили тестовый файл "data/punctuation_start.txt"
    When я запускаю "go run ../cmd/app/main.go data/punctuation_start.txt налоги России 5"
    Then выводится "1"

  Scenario: слова на разных строках
    Given подготовили тестовый файл "data/multiline.txt"
    When я запускаю "go run ../cmd/app/main.go data/multiline.txt налоги России 5"
    Then выводится "1"

  Scenario: очень большое расстояние
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги доходы 999999"
    Then выводится "2"

  Scenario: максимальное расстояние на границе
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги физических 6"
    Then выводится "2"

  Scenario: минимальное расстояние на границе
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги на 1"
    Then выводится "2"

  Scenario: несуществующее первое слово
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt nonexistent России 5"
    Then выводится "0"

  Scenario: несуществующее второе слово
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги nonexistent 5"
    Then выводится "0"

  Scenario: оба слова не существуют
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt nonexistent1 nonexistent2 5"
    Then выводится "0"

  Scenario: большой файл с множеством вхождений
    Given подготовили тестовый файл "data/large.txt"
    When я запускаю "go run ../cmd/app/main.go data/large.txt слово1 слово2 10"
    Then выводится "5"

  Scenario: неверный путь к файлу (с пробелами)
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/не существует.txt налоги России 5"
    Then ошибка

  Scenario: пустое имя файла
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go \"\" налоги России 5"
    Then ошибка

  Scenario: слишком много аргументов
    Given подготовили тестовый файл "data/Налоговый_кодекс.txt"
    When я запускаю "go run ../cmd/app/main.go data/Налоговый_кодекс.txt налоги России 5 лишний"
    Then ошибка
