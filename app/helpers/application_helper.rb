module ApplicationHelper
    def valid_json?(string)
        !!JSON.parse(string)
        rescue JSON::ParserError
        false
    end

    def track(event_type, object, data = {})
        TrackingLog.track(event_type, object, data, request.remote_ip, current_user)
    end
end
