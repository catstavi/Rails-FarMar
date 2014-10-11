class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def logged_vendor
    Vendor.find_by(id: session[:vendor_id])
  end

  def make_joined_string(array_of_obj)
    array = array_of_obj.collect { |obj| obj.name }
    array.join(', ')
  end

end
