require "./q8/base_api_client.rb"

class Q8::ZipClient
  BASE_URL = "https://api.zipaddress.net/"

  def initialize
    @client ||= Q8::BaseApiClient.new(BASE_URL)
  end

  def full_address(zipcode)
    raise ValidationError unless validate_zipcode(zipcode)
    res = @client.full_address(zipcode)
    result = res || "不明な住所"
    result
  end

  private

    def validate_zipcode(value)
      code_regex = /^[0-9]{3}[0-9]{4}$/

      value =~ code_regex
    end
end
