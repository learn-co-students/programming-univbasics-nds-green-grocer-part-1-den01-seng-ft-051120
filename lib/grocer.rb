require 'pp'
require 'pry'

def find_item_by_name_in_collection(name, collection)
  index = 0
  while index < collection.size do
    item = collection[index]
    if item[:item] == name
      return item
    end
    index += 1
  end
  nil
end


def consolidate_cart(cart)
  consolidated = []
  index = 0 
  while index < cart.size do 
    item = cart[index]
    if (find_item_by_name_in_collection(item[:item], consolidated) == nil)
      item[:count] = 1 
    else 
      item[:count] += 1 
    end
    consolidated << cart[index]
  index += 1 
  end
  consolidated
end


  