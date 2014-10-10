class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def logged_vendor
    if session[:vendor_id] == nil
      return nil
    else
      Vendor.find(session[:vendor_id])
    end
  end

  def make_joined_string(array_of_obj)
    array = array_of_obj.collect { |obj| obj.name }
    array.join(', ')
  end

end
