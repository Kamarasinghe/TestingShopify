class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(products)
    products_parsed = JSON.parse(products)
    
    # products_parsed.each_with_index do |product, idx| 
      
    # end
    puts 'THIS IS PRODUCT'
    print Product
  end
end
