class Customers::FavoritesController < ApplicationController
	def create
		    book = Book.find(params[:book_id])
            favorite = current_customer.favorites.new(book_id: book.id)
    		favorite.save
            book.create_notification_by(current_customer)
            redirect_to person_path(params[:person_id])
	end


	def destroy
			book = Book.find(params[:book_id])
    		favorite = current_customer.favorites.find_by(book_id: book.id)
    		favorite.destroy
    		redirect_to person_path(params[:person_id])
    end

private
    def favorite_params
        params.require(:favorite).permit(:person_id,:customer_id)
    end
end
