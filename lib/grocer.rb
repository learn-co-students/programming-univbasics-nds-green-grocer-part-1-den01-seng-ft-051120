require "pry"

def find_item_by_name_in_collection(name, collection)
  count = 0
  while count < collection.length do
    if collection[count][:item] == name
      return collection[count]
    end
    count += 1
  end

end

def consolidate_cart(cart)
  new_cart = []
  n = 0
  while n < cart.length do
    next_item = cart[n][:item]
    next_item_hash = cart[n]
    if find_item_by_name_in_collection(next_item, new_cart)
      next_item_hash[:count] += 1
      new_cart.push(next_item_hash)
    else
      next_item_hash[:count] = 1
      new_cart.push(next_item_hash)
    end
    n += 1
  end
  return new_cart
end
