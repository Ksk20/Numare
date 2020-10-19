class Customers::CustomersController < ApplicationController
	before_action :authenticate_customer!
	before_action :correct_customer, only: [:edit, :update, :destroy]

	def show
		@customer = Customer.find(params[:id])
		@portraits = @customer.portraits
	end

	def edit
		@customer = current_customer
	end

	def update
	 	@customer = current_customer
      if  @customer.update(customer_params)
     	  redirect_to customers_path(@customer.id), notice: "You have updated user successfully."
      else
    	render "edit"
      end
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to home_path
	end

private
	def customer_params
    	params.require(:customer).permit(:name,:introduction,:image_id,:back_image_id,:is_member,:email)
  	end

  	def correct_customer
     customer = Customer.find(params[:id])
     if current_customer != customer
      redirect_to customer_path(current_customer)
     end
    end
end
