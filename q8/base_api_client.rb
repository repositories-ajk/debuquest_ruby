require "faraday_middleware"

class Q8::BaseApiClient
  def initialize(url)
    @conn = Faraday.new(url: url) do |f|
      f.request :json
      f.request :retry
      f.response :follow_redirects
      f.response :json
    end
  end

  def full_address(zipcode)
    params = { zipcode: zipcode }
    res = @conn.get("/", params)
    res.body.dig("data", "fullAddress")
  end
end
