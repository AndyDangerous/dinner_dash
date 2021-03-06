class AddressesController < ApplicationController

  def create
    @address = Address.create(address_params)

    validate
  end

  def update
    @address = Address.find(params)

    validate
  end

  def address_params
    params.require(:address).permit(:street_1, :street_2, :city, :state, :zip, :order_id)
  end

  private

  def validate
    if @address.save
      redirect_to checkout_path
    else
      flash[:errors] = @address.errors.messages
      render "orders/checkout"
    end
  end

end
