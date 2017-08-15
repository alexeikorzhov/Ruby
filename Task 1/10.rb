#Написать код, который выводит массив из n-первых элементов последовательности чисел Фибонначи
#
#Решение должно работать для любого n.


def fib(n)
  arr = []
  if n == 0 
    return arr
  elsif n == 1 
    arr << 0
    return arr
  end
  a=0; b=1
  arr << a
  arr << b
  result=0
  while result < n-2
   arr << a+b
   a=b; b= arr[-1]
   result+=1
  end
  arr
end
