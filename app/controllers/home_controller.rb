class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 2 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

    products_1 = ShopifyAPI::Product.find(:all, params: { limit: 2, page: 1 })
    products_2 = ShopifyAPI::Product.find(:all, params: { limit: 2, page: 2 })

    print products_1
    puts "THIS ARE PRODUCTS"
    print products_2
    # product_count = ShopifyAPI::Product.count()
    # products_json = @products.to_json
    # SaveToDbJob.perform_later(products_json, product_count)
  end
end
