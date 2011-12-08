class HomeController < ApplicationController
  def index
    if current_user.admin?
      @transfers = Transfer.all(:order => 'created_at DESC', :limit => 5)
    end
  end

end
