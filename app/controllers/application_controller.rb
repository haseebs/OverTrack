class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def test
    render html: "IT WORKED!"
  end
end
