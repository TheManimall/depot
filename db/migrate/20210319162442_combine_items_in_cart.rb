class CombineItemsInCart < ActiveRecord::Migration[6.1]
  def change
  end

  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove indiviual items
          cart.line_items.where(product_id: product_id).delete_all

          #replace with a single item
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
