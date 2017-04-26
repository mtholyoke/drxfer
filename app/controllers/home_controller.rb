class HomeController < ApplicationController
  def index
    if current_user.admin?
      @transfers = Transfer.all.limit(5)
    end
  end
end