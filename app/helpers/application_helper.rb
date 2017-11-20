module ApplicationHelper
    def li_link_to(name, path, html_options={})
        content_tag :li, class: 'pure-menu-item'  do
            link_to name, path, html_options.merge(class: 'pure-menu-link')
            # link_to name, path, class: 'pure-menu-link', method: :delete
        end
    end
end