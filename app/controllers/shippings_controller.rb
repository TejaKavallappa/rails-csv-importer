class ShippingsController < ApplicationController

  def index
    @shippings = Shipping.order(sort_column).page(params[:page]).per(10)
  end

  def import
    @shipping_import = ShippingsImport.new(params[:file])

    if @shipping_import.save
      flash[:notice] =  ["Shipping address imported"]
      redirect_to root_url
    else
      flash[:errors] = @shipping_import.errors.full_messages
      redirect_to root_url
    end

  end

  private

  def sort_column
    Shipping.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

end
