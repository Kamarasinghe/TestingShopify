class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(product)
    puts 'THIS IS PRODUCT'
    product = JSON.parse(product)
    print product
    puts ''
  end
end
