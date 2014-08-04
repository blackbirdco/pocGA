class AnalyticsController < ApplicationController


  def enter
    render json: Analytic.new.fetch(:enter)
  end

end