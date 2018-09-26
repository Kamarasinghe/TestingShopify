class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(product)
    puts 'THIS IS PRODUCT'
    product = JSON.parse(product)
    print product.length
    puts ''
  end
end
