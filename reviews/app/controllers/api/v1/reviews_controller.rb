class Api::V1::ReviewsController < ActionController::API
    def index
      reviews = Review.all
      reviews = reviews.map do |review|
        { id: review.id, book_id: review.book_id, content: review.content }
      end
      
      render json: { results: reviews }.to_json, status: :ok
    end
end