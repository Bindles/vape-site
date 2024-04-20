json.extract! product, :id, :name, :handle, :price, :brand, :category, :desc, :image, :options, :variants, :created_at, :updated_at
json.url product_url(product, format: :json)
