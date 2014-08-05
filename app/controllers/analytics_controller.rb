class AnalyticsController < ApplicationController


  def enter
    @data= Analytic.new.fetch(:enter)
  end

end