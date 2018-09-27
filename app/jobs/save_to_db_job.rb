class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  rescue_from(Exception) do |exception|
    puts '^^^^^^^^^^^^^^^^^^^^'
    puts exception.message
    puts exception.backtrace
    puts 'vvvvvvvvvvvvvvvvvvvvvv'
  end

  def perform(products)
    products_parsed = JSON.parse(products)

    products_parsed.each do |product|
      product_id = product['id']
      product_title = product['title']
      product_desc = product['body_html']
      product_vendor = product['vendor']

      response = Product.where(product_id: product_id).first_or_create({
        title: product_title, 
        description: product_desc,
        vendor: product_vendor 
      })

      puts '####################'
      puts response.inspect
      puts '####################'

      # if !Product.find_by(product_id: '1593687670897')
      #   puts 'IT DOES NOT EXIST'
      #   # save_product = { product_id: product_id, 
      #   # Product.create(save_product)
      # else
      #   puts 'IT DOES EXIST'
      # end
    end
  end
end
