class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(product)
    puts 'THIS IS PRODUCT'
    parsed = JSON.parse(product)
    print parsed.length
  end
end
