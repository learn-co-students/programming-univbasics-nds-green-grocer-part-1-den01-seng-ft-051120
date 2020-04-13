def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0 
  while index < collection.length do 
    return collection[index] if collection[index][:item] == name
    index += 1 
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  index = 0 
  new_cart = []
  
  cart.each do |grocery_item| 
    current_item = find_item_by_name_in_collection(grocery_item[:item], new_cart)
    if current_item 
      new_cart.each do |item_in_new_cart|
        if item_in_new_cart[:item] === current_item[:item]
          item_in_new_cart[:count] += 1
        end
      end
    else 
      grocery_item[:count] = 1
      new_cart << grocery_item
    end 
    index += 1 
  end
  new_cart
end


  