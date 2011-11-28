class HomeController < ApplicationController
  def index
    if current_user.admin?
      @transfers = Transfer.all
    end
  end

end
