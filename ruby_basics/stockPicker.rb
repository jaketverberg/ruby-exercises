stonks = [12, 14, 15, 5, 7, 2, 6, 12, 16, 19, 3, 20, 4, 18, 1, 4, 6, 8, 10]

def stock_picker(array)
  result = []

  hash = {}
  array.each_with_index { |item, index| 
    hash[index] = item
  }
  new_hash = hash
  
  last_highest_pair = 0

  for num in hash
    new_hash.delete(num[0])
    for eval_num in new_hash
      if eval_num[1] - num[1] > last_highest_pair
        last_highest_pair = eval_num[1] - num[1]
        result = [num[0], eval_num[0]]
      end #end IF statement
      if new_hash.values[0] - hash.values[-1] > last_highest_pair
        last_highest_pair = new_hash.values[0] - hash.values[-1]
        result = [hash.values[-1], new_hash.values[0]]
      end #end IF statement
    end #end inner FOR statement
  end #end outer FOR statment
  result
end #end stock_picker FUNCTION

p stock_picker(stonks)
