module GoogleAnalytics
  extend ActiveSupport::Concern

  included do
    attr_accessor :untracked_actions
    after_filter  :track_pageview, except: :untracked_actions
  end

  def tracker
    @tracker ||= Staccato.tracker(GA_TRACKING_ID, generate_uuid,# pass current_user.md5 (ou w/er)here
                                                  tracker_defaults)
  end

  def track_pageview
    @hit = Staccato::Pageview.new(tracker, path: request.env['PATH_INFO'])
    add_custom_dimensions
    add_custom_metrics
    @hit.track!
  end

  protected

  def generate_uuid
    rand(10) # presque
  end

  # see https://github.com/tpitale/staccato#global-options
  def tracker_defaults
    {
      document_hostname: "lol.blackbird.co",
      user_id: 1, # or, you know, something else maybe
    }
  end

  def add_custom_dimensions
    @hit.add_custom_dimension(1, 'my_community') # the number comes from the GA website
  end

  def add_custom_metrics
    # if ever needed
  end
end