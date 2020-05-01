def find_item_by_name_in_collection(name, collection)
  # Go through each item in the collection and return if it matches input name
  collection.each do |item|
    if item[:item] == name
      return item
    end
  end
  return nil
end

def find_item_index(name, collection)
  index = nil
  collection.each do |hash|
    if hash[:item] == name
      index = collection.index(hash)
      return index
    end
  end
  index
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  consolodated_cart = []
  cart.each do |item|
    # if the item is already in the cart, update item count
    if find_item_index(item[:item], consolodated_cart)
      consolodated_cart[find_item_index(item[:item], consolodated_cart)][:count] += 1
      next
    end
    # else add item to consolodated cart and create count in item hash
    count_item = item
    count_item[:count] = 1
    consolodated_cart << count_item
  end
  return consolodated_cart
end

items = [
      {:item => "AVOCADO", :price => 3.00, :clearance => true},
      {:item => "KALE", :price => 3.00, :clearance => false},
      {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
      {:item => "ALMONDS", :price => 9.00, :clearance => false},
      {:item => "AVOCADO", :price => 3.00, :clearance => true},
      {:item => "TEMPEH", :price => 3.00, :clearance => true},
      {:item => "CHEESE", :price => 6.50, :clearance => false},
      {:item => "BEER", :price => 13.00, :clearance => false},
      {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
      {:item => "TEMPEH", :price => 3.00, :clearance => true},
      {:item => "BEETS", :price => 2.50, :clearance => false},
      {:item => "SOY MILK", :price => 4.50, :clearance => true},
      {:item => "TEMPEH", :price => 3.00, :clearance => true}
    ]
puts consolidate_cart(items)