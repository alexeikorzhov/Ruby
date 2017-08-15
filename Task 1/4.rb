# Дано целое число. Найти и вернуть сумму его цифр.


def test(value)
value.to_s.split('').map { |i| i.to_i}.reduce(0, :+)
end
