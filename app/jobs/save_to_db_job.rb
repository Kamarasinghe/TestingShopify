class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(product)
    puts 'THIS IS PRODUCT'
    print product
    puts ''
  end
end
