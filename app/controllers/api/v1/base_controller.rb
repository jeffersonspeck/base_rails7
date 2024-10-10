module Api
  module V1
    class BaseController < ActionController::API
      before_action :authenticate_user_from_token!

      private

      def authenticate_user_from_token!
        token = request.headers['Authorization']
        user = User.find_by(authentication_token: token)

        if user
          sign_in user, store: false
        else
          render json: { error: 'Acesso não autorizado' }, status: :unauthorized
        end
      end
    end
  end
end