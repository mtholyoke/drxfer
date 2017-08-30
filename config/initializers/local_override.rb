require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class LocalOverride < Authenticatable
      def valid?
        true
      end

      def authenticate!
        if params[:user] 
          if params[:user][:username] == "test" && params[:user][:password] == "test"
            user = User.first
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