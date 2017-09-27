require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class LocalOverride < Authenticatable
      def valid?
        true
      end

      def authenticate!
        if params[:user] 
          if params[:user][:username] == "admin" && params[:user][:password] == "admin"
            user = User.where(admin: true).first
            success!(user)
          elsif params[:user][:username] == "test" && params[:user][:password] == "test"
            user = User.where(admin: false).first
            success!(user)
          else
            fail(:invalid)
          end
        else    
          pass
        end
      end
    end
  end
end