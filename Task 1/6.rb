#Проверить, является ли она палиндромом


def palindrome(value)
  value.downcase == value.downcase.reverse
end
