module Admin
    module BaseHelper
        class << self
            def back_button(view)
                view.link_to :back, class: 'pure-button' do
                    view.content_tag :i, 'arrow_back', class: 'material-icons md-18'
                end
            end

            def render_action_bar(view)
                view.render 'action_bar' if should_render_action_bar?(view)
            end

            private def should_render_action_bar?(view)
                %i[left_action action_title right_action].map do |content|
                    view.content_for?(content)
                end.any?
            end
        end
    end
end
