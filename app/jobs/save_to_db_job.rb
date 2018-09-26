class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(product, product_count)
    parsed = JSON.parse(product)
    
    puts 'THIS IS PRODUCT COUNT', product_count
  end
end
