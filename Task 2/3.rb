#Апгрейд стандартной библиотеки. Добавить метод массивам, который будет возвращать все чётные числа, соответсвующие переданному в блок условию:
#
#Чтобы это работало, делаем так:


class Array
  def even_search
    find_all{ |elem| elem % 2 == 0 }
    delete_if { |a| a.odd?}
    select {|a| yield a} if block_given?
  end
end
