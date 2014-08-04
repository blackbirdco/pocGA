require "google_analytics"

class Analytic

  include LegatoHelpers

  def initialize
    @profile = service_account_user.profiles.first
  end

  def fetch(legato_model_class)
    result = @profile.send(legato_model_class)
    GoogleAnalyticsSerializer.serialize(result)
  end

end