class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(products)
    products_parsed = JSON.parse(products)
    
    products_parsed.each do |product|
      product_id = product['id']
      product_title = product['title']
      product_desc = product['body_html']
      product_vendor = product['vendor']

      if !Product.find_by product_id: product_id
        save_product = { product_id: product_id, title: product_title, description: product_desc, vendor: product_vendor }
        product_to_save = Product.new(save_product)
        product_to_save.save
      end
    end
  end
end
