class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  helper_method :how_much_time

  def how_much_time(params)
    now = Time.new
    diff = (now - params).to_i
    if diff < 60
    	return diff.to_s + " s"
    elsif diff < (60*60)
    	return (diff/60).to_s + " m"
    elsif diff < (60*60*24)
    	return (diff/(60*60)).to_s + " h"
    elsif diff < (60*60*24*30)
    	return (diff/(60*60*24)).to_s + " d"
    elsif diff < (60*60*24*365)
    	return (diff/(60*60*24*30)).to_s + " M"
    elsif diff >= (60*60*24*365)
    	return (diff/(60*60*24*30*365)).to_s + " Y"
    end
  end

  def render_404
    render :file => '/public/404.html', status => 404, :layout => false
  end

end
