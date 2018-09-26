class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(products)
    products_parsed = JSON.parse(products)
    
    # products_parsed.each_with_index do |product, idx| 
    #   save_product = { :title => product.title, :description => product.body_html, :vendor => product.vendor }
    #   product_to_save = Product.new(save_product)
    #   product_to_save.save
    # end

  end
end
