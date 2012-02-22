class AdminController < ApplicationController
  before_filter :chequear_login
  layout 'admin'
  
private
  def chequear_login
    unless logueado?
      redirect_to new_session_path
    end
  end  
end
