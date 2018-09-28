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
      variant_id = variant['id']
      variant_title = variant['title']
      variant_price = variant['price'] 
      variant_position = variant['position']

      response = Variant.where({
        product_id: product_id, variant_id: variant_id 
      }).first_or_create({
        price: variant_price,
        position: variant_position,
        title: variant_title
      })

      puts 'RESPONSE FOR IMAGE !!!!!!!!!!!!!!'
      puts response.errors.full_messages
      puts 'RESPONSE FOR IMAGE @@@@@@@@@@@@@@'
      
    end
  end

  def save_images(images, product_id, product_variants)
    images.each_with_index do |image, idx|
      image_position = image['position']
      image_url = image['src']
      image_variant_ids = image['variant_ids']
      image_variant_id = product_variants[idx]['id']

      image_variant_ids = image_variant_ids.length > 0 ? image_variant_ids : [ image_variant_id ]

      response = Image.where({
        product_id: product_id, position: image_position
      }).first_or_create({
        image_url: image_url,
        variant_ids: image_variant_ids
      })

      puts 'RESPONSE FOR IMAGE !!!!!!!!!!!!!!'
      puts response.errors.full_messages
      puts 'RESPONSE FOR IMAGE @@@@@@@@@@@@@@'
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

      Product.where(product_id: product_id).first_or_create({
        title: product_title, 
        description: product_desc,
        vendor: product_vendor 
      })

      save_variants(product_variants, product_id)
      save_images(product_images, product_id, product_variants)
    end
  end
end
