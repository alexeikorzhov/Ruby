#Прибавить 100 к максимальному элементу заданого массива и вернуть его.


def test(array)
max = array.max
while array.index(max) do
array[array.index(max)] = max+100
end
array
end
