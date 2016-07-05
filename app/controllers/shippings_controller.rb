class ShippingsController < ApplicationController

  def index
    @shippings = Shipping.all
  end

  def import
    @shipping_import = ShippingsImport.new(params[:file])

    if @shipping_import.save
      redirect_to root_url, notice: "Shipping address imported"
    else
      flash[:errors] = @shipping_import.errors.full_messages
      redirect_to root_url
    end

  end

end
