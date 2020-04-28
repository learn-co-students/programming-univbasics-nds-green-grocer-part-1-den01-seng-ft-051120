require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.each_entry do |item|
    if item.has_value?(name)
      return item
    end
  end
  nil
end

def consolidate_cart(cart)
  res = []
  cart.each_entry do | item |
    if find_item_by_name_in_collection(item[:item], res) == nil
      item[:count] = 1
      res.append(item)
    else
      item[:count] +=1
    end
  end
  res
end
