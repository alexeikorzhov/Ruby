#Реализовать Ruby модуль для парсинга определенных данных следующей архитектуры:
#
#Условия:
#
#    Все должно быть заскоуплено в модуле Parser
#    Внутри модуля должен быть класс Base с общим фунционалом для всех кастомных парсеров
#    В Base должна быть константа TIMEOUT_LIMIT со значеним по-умолчанию 1 секунда. Данная константа может быть переопределена в каждом кастомном классе
#    Каждый кастомный парсер должен наследоваться от Base
#    Во всех классах публичными должны быть только перечисленные методы, вся остальная реализация должна быть сокрыта.
#    Список доступных публичных методов (за исключением стандартных):
#        parse
#        report
#        search_key
#        search_key=(...)
#    Обзор парсеров:
#         class Base: базовый парсер, принимает на вход текст и подстроку, его report вовзращает количество найденых совпадений, а search_key позволяет изменить подстроку для поиска. Пример работы:
#         class Link: парсер который достает все ссылки из переданного текста, принимает только текст. Пример работы:
#         class Custom: парсер который реализует построчный поиск переданного текста произвольным образом, принимает только текст. Пример работы:
#    В случае возникновения ошибки при парсинге, метод parse не должен падать, а метод report в таком случае возвращает соответствующее классу нулевое значение: 0 - для Base, [] - для всех остальных.

module Parser
  class Base
  TIMEOUT_LIMIT = 1
  attr_accessor :search_key
    def initialize(string, search_key)
      @string=string
      @search_key=search_key
    end

    def parse
      @res = @string.scan(@search_key).count
      self
    end

    def report
      @res
    end
  end
  
  class Link < Base
    def initialize(string)
      @string=string
    end
    
    def parse
      @res = @string.scan(/href='(.*)'/).flatten
      self
    end
    
    def report
      @res
    end
  end
  
  class Custom < Base

    def initialize(string)
      @string = string     
    end

    def parse (&block)
      begin
        a = [] 
        @string.each_line {|e| a << yield(e)}
      rescue
        a = []
      end
      @res = a
      self
    end
  end
end
