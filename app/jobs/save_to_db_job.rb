class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(products)
    products_parsed = JSON.parse(products)
    
    products_parsed.each do |product|
      product_title = product[:title]
      product_desc = product[:body_html]
      product_vendor = product[:vendor]
      
      print 'PRODUCT TITLE', product_title
      puts ''
      print 'PRODUCT DESCRIPTION', product_desc
      puts ''
      print 'PRODUCT VENDOR', product_vendor

      # save_product = { :title => product.title, :description => product.body_html, :vendor => product.vendor }
      # product_to_save = Product.new(save_product)
      # product_to_save.save
    end

  end
end
