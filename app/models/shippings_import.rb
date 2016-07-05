class ShippingsImport < ActiveRecord::Base

  def initialize(uploaded_file)
    @file = uploaded_file
  end

  def save
  end

end
