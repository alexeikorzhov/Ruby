#Дан хэш:
#Ответить на вопрос: если ли в магазине какой-либо продукт с заданой ценой?

def test(value)
  shop = {
    milk: 10,
    bread: 8,
    cornflakes: 12,
    ice_cream: 15,
    pie: 20
 }

shop.values.include? (value)
end
