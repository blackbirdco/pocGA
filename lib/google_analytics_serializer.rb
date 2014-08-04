class GoogleAnalyticsSerializer

  def self.serialize(legato_query)

    result = legato_query.map{|v| v.to_h}

    result.map!{|v| v.map{|key, v|  {(key.to_s == "dimension1") ? (:community) : (key) => v} }.reduce(:merge)}

  end

end