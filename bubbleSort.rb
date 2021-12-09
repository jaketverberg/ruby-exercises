arry = [15, 6, 11, 3, 19, 4, 17, 13, 1, 16, 12, 5, 7, 14, 18, 9, 10, 2, 20, 8]

def bubbleSort(array)
  n = (array.length - 1)
  unsorted = true

  while unsorted do
    unsorted = false
    n.times do |num|
      if array[num] > array[num+1]
        array[num], array[num+1] = array[num+1], array[num]
        unsorted = true
      end #IF
    end #TIMES
  end #UNTIL

  array
end #bubbleSort

p bubbleSort(arry)
