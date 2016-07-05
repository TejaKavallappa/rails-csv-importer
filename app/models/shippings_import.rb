class ShippingsImport < ActiveRecord::Base

  attr_reader :file

  def initialize(uploaded_file)
    @file = uploaded_file
  end

  def save
    if imported_shippings.map(&:valid?).all?
      # If all rows are valid, then save all of them to the database
      imported_shippings.each(&:save)
      true
    else
      imported_shippings.each_with_index do |shipping, index|
        add_shipping_errors(shipping,index)
      end
      false
    end

  end

  def add_shipping_errors(shipping, index)
    shipping.errors.full_messages.each do |message|
      next if message == "Last name has already been taken"
      errors.add :base, "Row #{index}: #{message}"
    end
    
  end

  def imported_shippings
    @imported_shippings ||= load_file
  end

  def load_file
    raise "Please upload a valid file" if file.nil?

    mappings = {"fname" => "first_name", "lname" => "last_name",
      "zip" => "zip_code"}
    @imported_shippings = []

    CSV.foreach(file.path, headers: true) do |row|
      shipping = Shipping.new
      shipping_csv = row.to_hash.slice("fname", "lname",
        "address", "city", "state", "zip")
      shipping.attributes = shipping_csv.map {|k, v| [mappings[k] || k, v] }.to_h
      @imported_shippings << shipping
    end

    @imported_shippings
  end

end
