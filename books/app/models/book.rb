class Book
  include Mongoid::Document
  field :name, type: String
  field :store_id, type: String
end
