
require 'pry';

#Find item in a collection and return if found, nil if not
def find_item_by_name_in_collection(name, collection)
  collection.find { |item_hash| 
    item_hash[:item] == name
  }
end

#Enumerate through a cart of item hashes, adding a count and parsing down duplicates 
def consolidate_cart(cart)
  cart = cart.reduce([]) { |item_collection, item_hash| 
    #binding.pry; 
    if find_item_by_name_in_collection(item_hash[:item], item_collection)
      item_collection.find { |item_hash2| 
        item_hash2[:item] == item_hash[:item]
      }[:count] += 1; 
      item_collection; 
    else 
      i = item_collection.length
      item_collection[i] = item_hash;
      item_collection[i][:count] = 1; 
      item_collection; 
    end 
  }
end

