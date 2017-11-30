module Admin
    class BaseController < ApplicationController
        before_action :authenticate_admin_user!

        class Unauthorized < StandardError

        end

        rescue_from Unauthorized, with: :render_unauthorized
        # Alternative:
        # rescue_from Unauthorized, with: lambda do
        # render 'unauthorized', status: :unauthorized

        # with -> {
        # render 'unauthorized', status: :unauthorized
        # }

        def render_unauthorized
            render 'unauthorized', status: :unauthorized
        end

        def authenticate_admin_user!
            raise Unauthorized unless current_user&.role == 'admin'
            # alternate: current_user && current_user.role == 'admin'
        end
    end
end