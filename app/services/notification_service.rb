class NotificationService
  def notify_third_parties(notification)
    endpoints = ENV['THIRD_PARTY_API_ENDPOINTS']&.split(',')
    return unless endpoints

    endpoints.each do |endpoint|
      begin
        uri = URI.parse(endpoint)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
        request.body = notification.to_json
        http.use_ssl = (uri.scheme == 'https')
        response = http.request(request)
      rescue StandardError => e
        Rails.logger.error "Failed to connect to the endpoint #{endpoint}: #{e.message}"
      end
    end
  end
end