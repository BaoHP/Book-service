class Review
  include Mongoid::Document
  field :book_id, type: String
  field :content, type: String
end
