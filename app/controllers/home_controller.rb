class HomeController < ApplicationController

  def loan_app
    if Rails.env.development?
      redirect_to 'http://localhost:4200'
    end
  end

end