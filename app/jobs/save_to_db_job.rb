class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(products)
    products_parsed = JSON.parse(products)
    
    products_parsed.each_with_index do |product, idx| 
      save_product = Product.new()
      save_product.title = product.title
      save_product.description = product.body_html
      save_product.vendor = product.vendor
      save_product.save 
    end

  end
end
