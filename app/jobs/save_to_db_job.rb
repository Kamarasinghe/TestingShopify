class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  rescue_from(Exception) do |exception|
    puts '@@@@@@@@@@@@@@@@@@@@@@'
    puts exception.message
    puts exception.backtrace
    puts '@@@@@@@@@@@@@@@@@@@@@@'
  end

  def save_variants(variants, product_id)
    variants.each do |variant|
      puts '&&&&&&&&&&&&&&&&&&&'
      puts variant
      puts '&&&&&&&&&&&&&&&&&&&'

      variant_title = variant['title']
      variant_price = variant['price']
      variant_position = variant['position']

      Variant.where([
        'product_id = :product_id and title = :title', 
        { product_id: product_id, title: variant_title }
      ]).first_or_create({
        product_id: product_id,
        title: variant_title,
        price: variant_price,
        position: variant_position
      })
    end
  end

  def perform(products)
    products_parsed = JSON.parse(products)

    products_parsed.each do |product|
      product_id = product['id']
      product_title = product['title']
      product_desc = product['body_html']
      product_vendor = product['vendor']
      product_variants = product['variants']
      product_images = product['images']

      puts 'THIS IS THE PRODUCT!!!!!!!!!!!!!!!!!!!!!!!'
      puts product['variants']
      puts 'THIS IS THE PRODUCT$$$$$$$$$$$$$$$$$$$$$$$'

      Product.where(product_id: product_id).first_or_create({
        title: product_title, 
        description: product_desc,
        vendor: product_vendor 
      })

      save_variants(product_variants, product_id)
    end
  end
end
