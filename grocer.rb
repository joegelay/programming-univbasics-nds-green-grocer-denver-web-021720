def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
  item = nil
  i = 0 
  while i < collection.length do 
    if name == collection[i][:item]
       item = collection[i]
    end 
    
  i += 1 
  end 
  return item
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  result = []
  i = 0 
  while i < cart.length do 
    item = cart[i][:item]
    # check to see if item is in result array 
    if !find_item_by_name_in_collection(item, result)
      cart[i][:count] = 1 
      result << cart[i]
    else 
      item_to_update = find_item_by_name_in_collection(item, result)
      item_to_update[:count] += 1
    end 
    i += 1 
  end 
  
  return result
end

def apply_coupons(cart, coupons)
  
   # Taking in a 'cart' array, checking to see if any of items have coupons that apply to them in the 'coupon' array. 
    # If no, just add that item to the 'result' array. 
    # If yes, update item from 'cart' array by comparing :count of 'cart' item and 'coupon item' num. 
      # If equal, update 'cart item' price to result of ('coupon cost' / 'coupon num') AND item name to 'ITEM + W/COUPON', add to result array.
      # If :count > num, update 'cart item' to (count - num), add to result array. 
        # AND make a copy of 'cart item' with :item = "ITEM + W/COUPON", price = ('coupon cost' / 'coupon num'), and count = coupon num
      # If :count < num, add cart item to result array.
      
  
  i = 0 
  while i < coupons.length do
    cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
    couponed_item_name = "#{coupons[i][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[:count] -= coupons[i][:num]
      else 
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => (coupons[i][:cost] / coupons[i][:num]),
          :count => coupons[i][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[i][:num]
      end
    end
    i += 1 
  end
 cart
end


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  i = 0 
  while i < cart.length do 
    if cart[i][:clearance]
      cart[i][:price] = cart[i][:price] * 0.80
    
    i += 1 
    
  
  end
  
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
