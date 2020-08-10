class ApplicationController < ActionController::Base
  def greeting
    render html: "Hi!" 
  end
end
