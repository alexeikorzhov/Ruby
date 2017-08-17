#!/usr/bin/env ruby

module Mtn
  class Status400 < StandardError ; end
  class Status500 < StandardError ; end
  class TimeoutError < StandardError ; end
end

class Server
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  
  def status
    true
#    raise Mtn::TimeoutError 
  end
end





module Mtn
  #:nodoc:
  class Healthcheck
    def initialize(name)
      @name = name
      @good = 0
      @all = 0
    end

    def status
      if @name.status
        @good += 1
        @result = 'OK'
      end
    rescue Mtn::Status400, Mtn::Status500, Mtn::TimeoutError => e
      @result = e.to_s.upcase
    rescue
      @result = 'FAIL'
    end

    def check!
      @all += 1
      @result = status
      @result += " (#{@good}/#{@all})" unless @result == 'FAIL'
      @result
    end
  end
end


server1 = Server.new('server1') 



mtn1 = Mtn::Healthcheck.new(server1)
#mtn2 = Mtn::Healthcheck.new(server2)
#mtn3 = Mtn::Healthcheck.new(server3)
mtn4 = Mtn::Healthcheck.new('xx не сервер или ошибка случилась внутри самого сервиса xx')

p mtn1.check! #== "OK (1/1)"
#mtn2.check! # => "MTN::TIMEOUTERROR (0/1)"
#mtn3.check! # => "MTN::STATUS500 (0/1)"
#p mtn4.check! # => "FAIL"

p mtn1.check! #== "OK (2/2)"
#mtn2.check! # => "MTN::TIMEOUTERROR (0/2)"
#mtn3.check! # => "MTN::STATUS400 (0/2)"
p mtn4.check! # => "FAIL"

'Healthcheck should handle own exceptions'
