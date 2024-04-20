class Product < ApplicationRecord
  # Define the options column as JSONB NVm

  # Validation examples
  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true
end
