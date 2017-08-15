#Дано число. Вернуть число, где первая цифра стала последней, вторая - предпоследней и тд.

#Ноль остается нулем.

#Знак минуса также сохраняется.

def test(value)
  if value < 0 
    value=value.to_s.reverse!.to_i*(-1)
  else
    y = 0
    while value > 0 do
      y = y*10
      y = y + value%10
      value = value/10 
    end
    value = y
  end
end
