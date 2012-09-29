class Generator
  def self.locales
    [["German", :de], ["English", :en], ["French", :fr], ["Dutch", :nl], ["Polish", :pl], ["Vietnamese", :vi]]
  end

  def self.types
    types = {
      "Address" => [:city, :street_name, :street_address, :secondary_address, :zip_code, :street_suffix, :city_suffix, :city_prefix, :state_abbr, :state],
      "Company" => [:name, :suffix, :catch_phrase, :bs],
      "Internet" => [:email, :user_name, :domain_name, :domain_word, :domain_suffix, :ip_v4_address, :ip_v6_address],
      "Name" => [:name, :first_name, :last_name, :prefix, :suffix],
      "PhoneNumber" => [:phone_number]
    }

    types.each do |name, values|
      types[name] = values.map{|v| [v, "#{name.downcase}.#{v}"]}
    end
    types
  end
end
