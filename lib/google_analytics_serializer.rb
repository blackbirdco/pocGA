class GoogleAnalyticsSerializer

  def self.serialize(legato_query)

    results = Array.new

    legato_query.each{|v| results << v.to_h}

    results.each do |result|
      dimensions_to_understandable_key(result, :dimension1, :community)
    end

  end

  private

  def self.dimensions_to_understandable_key(hash, dimension, understandable_key)
    hash[understandable_key] = hash.delete dimension
  end

end