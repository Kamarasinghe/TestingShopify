class SaveToDbJob < ApplicationJob
  @queue = :saveToDb

  def perform(product)
    parsed = JSON.parse(product)
    print 'THIS IS PRODUCT ', parsed.length
  end
end
