# frozen_string_literal: true

# Helper function for Authentication
module AuthHelper
    class << self
        def user_navigation(view)
            view.content_tag :ul, class: 'pure-menu-list right' do
                if view.user_signed_in?
                    view.render 'signed_in'
                else
                    view.render 'signed_out'
                end    
            end
        end
    end
end
