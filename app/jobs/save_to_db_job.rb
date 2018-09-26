class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(products)
    products_parsed = JSON.parse(products)
    
    products_parsed.each_with_index do |product, idx| 
      puts "THIS IS PRODUCT #{idx}!!!!"
      print product
    end
  end
end
