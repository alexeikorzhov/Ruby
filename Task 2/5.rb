#Обрабатывая поток логов на нужно прятать все наши пароли.
#
#Реализовать метод sanitize_password!, который получает на вход строку, и изменяет её таким образом, что всё что находится после ключевого слова: password: и до следуюещего слова должно быть заменено на ****** (6 звёздочек).


def sanitize_password!(s)
  s = "{server:\nuser:root\npassword:xcvsdd\nhost:localhost".split[2]
    if s.include?('password')
      s.gsub!(/password:xcvsdd/, "password:******")
    else
      s = s
    end
  puts s
end
