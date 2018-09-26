ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "3f7f5e4746ffa203e6de75e77219673c"
  config.secret = "92867580303da0f5bb4f2186b3dd19b5"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
