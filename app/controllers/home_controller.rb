class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 2 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

    # products_1 = ShopifyAPI::Product.find(:all, params: { limit: 2, page: 1 })
    # products_2 = ShopifyAPI::Product.find(:all, params: { limit: 2, page: 2 })

    product_count = ShopifyAPI::Product.count()
    i = 1
    # while (i <= product_count) do
    #   products = ShopifyAPI::Product.find(:all, :params => { :limit => 2, :page => i })
    #   products_json = products.to_json
    #   SaveToDbJob.perform_later(products_json)
    #   i += 1
    # end

    save_product = { title: 'TEST FROM CONTROLLER', description: 'This is a description', vendor: 'Test Vendor' }
    product_to_save = Product.new(save_product)
    if product_to_save.save
      puts 'IT SAVED!!!!!'
    end
    
    # products_json = @products.to_json
    # SaveToDbJob.perform_later(products_json, product_count)
  end
end
