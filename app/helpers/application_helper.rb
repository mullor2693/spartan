module ApplicationHelper
    def valid_json?(string)
        !!JSON.parse(string)
        rescue JSON::ParserError
        false
    end

    def track(event_type, object, data = {})
        TrackingLog.track(event_type, object, data, request.remote_ip, current_user)
    end

    # View helpers
    def remote_link(data_link, text, options={})
        link_class = options[:class] ? "ajaxNew #{options[:class]}" : "ajaxNew"
        return "<a class='#{link_class}' data-link='#{url_for data_link}'>#{text}</a>".html_safe
    end
    
    def remote_icon_link(data_link, icon_name, options={})
        link_class = options[:class] ? "uk-icon ajaxNew #{options[:class]}" : "uk-icon ajaxNew"
        icon_class = options[:'icon-class'] ? "#{options[:'icon-class']}" : ""
        return "<a class='#{link_class}' data-link='#{url_for data_link}'><span class='#{icon_class}' uk-icon='#{icon_name}'></span></a>".html_safe
    end
    
end
