defmodule Utils do
  defmacro repeat(times, do: block) do # Определение функции repeat ввиду отсутствия в языке таковой
    quote do
      for _ <- 1..unquote(times) do
       unquote(block)
      end
    end
  end
end

defmodule Main do
  import Utils # Импорт функций из модуля Utils
  n = IO.gets("Type number of strings: ") #Ввод количества строк
    |>String.trim("\n") # Удаление символа перевода строки
    cond do 
        Regex.match?(~r/\d+/,n) -> # Сравнение вводимой строки на соответсвие регулярному выражению
          n = String.to_integer n  # Преобразование строки в число
          cond do 
               n<101 && n > 0 -> # Условие по вводу не более 100 строк
                repeat(n) do # Повторение цикла n раз
                 y =  IO.gets("Numbers: ") # Ввод строки с двумя группами через пробел
                  |>String.trim("\n") # Удаление символа перевода строки
                  |>String.split(" ") # Разбиение строки на элементы списка по ключю " " (пробел)
                 cond do
                  length(y) == 2 && Enum.all?(y,fn(x) -> Regex.match?(~r/\d+/,x) end) -> # Проверка на количество элементов массива и соответствие сивмолов числам
                      Enum.map(y,fn(x) -> String.reverse(x) end)  # Примение функции reverse для каждого элемента списка(строки)
                        |>Enum.map(fn(x) -> String.to_integer(x) end) # Перевод элементов списка из строчного типа в числовой
                        |>Enum.sum # Суммирование элементов списка
                        |>to_string # Перевод в строчный тип
                        |>String.reverse # Примение функции reverse для полученной суммы
                        |>String.to_integer # Перевод элементов списка из строчного типа в числовой
                        |>IO.inspect(label: "Result ") # Вывод результата в консоль 
                    true -> IO.puts("Wrong number of elements or exist non integer element!") # Вывод при невыполнении условия в строке 25  
                 end
              end
          end
       true -> IO.puts("Wrong symbol!") # Вывод при невыполнении условия в строке 19
    end
end