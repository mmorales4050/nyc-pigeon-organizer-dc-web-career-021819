def nyc_pigeon_organizer(data)
  # write your code here!
  names = []
  reformatted_hash = {}
  # Create unique list of pigeon names
  data.values.each do |item|
    names = names + item.values
  end
  names = names.flatten!
  names = names.uniq

  # Create outline of new hash
  names.each do |name|
    reformatted_hash.merge!(name => {data.keys[0] => [], data.keys[1] => [], data.keys[2] => []})
  end

  # add details
  names.each do |name|
    # Adds colors
    data.values[0].each do |key, value|
      if value.include?(name)
        reformatted_hash[name][data.keys[0]] << key.to_s
      end
    end
    # Adds Gender
    data.values[1].each do |key, value|
      if value.include?(name)
        reformatted_hash[name][data.keys[1]] << key.to_s
      end
    end
    # Adds Lives
    data.values[2].each do |key, value|
      if value.include?(name)
        reformatted_hash[name][data.keys[2]] << key.to_s
      end
    end
  end
  return reformatted_hash
end

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

nyc_pigeon_organizer(pigeon_data)
