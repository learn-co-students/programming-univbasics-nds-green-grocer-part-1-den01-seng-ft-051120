require = 'pry'

def find_item_by_name_in_collection(name, collection)  
  collection.each do |element|
    element.each do |key, value|
      if key == :item
        if value == name
          return element
        else
        end
      else
      end
    end
  end
  return nil
end
      

def consolidate_cart(cart)
  #variable set
  unconsolidated_cart = []
  con_cart = []
  check_array = []

  #new copy of cart called "unconsolidated_cart"
  unconsolidated_cart = Marshal.load(Marshal.dump(cart))

  #adding ":count" key to each hash in "unconsolidated_cart"
  i = 0
  while i < unconsolidated_cart.length
    unconsolidated_cart[i].store(:count, 1)
    i += 1
  end

  #making a new copy of unconsolidated_cart, removing duplicate keys to be returned 
  con_cart = Marshal.load(Marshal.dump(unconsolidated_cart))
  con_cart = con_cart.uniq

  #outer loop, checking each key in con_cart against unconsolidated_cart   
  i = 0
  while i < con_cart.length
    check_array << con_cart[i][:item]
    check_array << 1
    i += 1
  end 
  #outer loop, checking each key in con_cart against unconsolidated_cart    
    i2 = 0
    check = ""
    while i2 < con_cart.length
      check = con_cart[i2][:item]
        #inner loop, counting how many times each key in con_cart is in unconsolidated_cart
        i = 0
        mult = 0
        while i < unconsolidated_cart.length
          if unconsolidated_cart[i][:item] == check
            mult += 1
          else
          end
          i += 1
        end

      #update the count key in con_cart for number of items
      con_cart[i2][:count] = mult
      i2 += 1
    end
  return con_cart
end
  