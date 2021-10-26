
module Q8::BaseApiClient
  private

  def self.get_connection(url, params = nil)
    conn = Faraday.new(url: url, params: params) do |f|
      f.request :json
      f.request :retry
      f.response :follow_redirects
      f.response :json
    end

    res = conn.get
  end
end