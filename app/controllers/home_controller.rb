class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 2 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

    product_count = ShopifyAPI::Product.count()
    products_json = @products.to_json
    SaveToDbJob.perform_later(products_json, product_count)
  end
end
