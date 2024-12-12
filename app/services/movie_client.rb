require 'uri'
require 'net/http'
require 'json'

class MovieClient
  BASE_URL = "https://moviesdatabase.p.rapidapi.com"
  
  def initialize(api_key)
    @api_key = api_key
  end

  def upcoming_movies
    make_request(
      endpoint: "/titles/x/upcoming"
    )
  end

  private

  def make_request(endpoint:, params: {})
    url = build_url(endpoint, params)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = @api_key
    request["x-rapidapi-host"] = 'moviesdatabase.p.rapidapi.com'

    response = http.request(request)
    
    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    else
      handle_error(response)
    end
  end

  def build_url(endpoint, params = {})
    uri = URI("#{BASE_URL}#{endpoint}")
    uri.query = URI.encode_www_form(params) unless params.empty?
    uri
  end

  def handle_error(response)
    error_message = begin
      JSON.parse(response.body)["message"] || "Request failed with status: #{response.code}"
    rescue
      "Request failed with status: #{response.code}"
    end

    raise MovieClientError.new(error_message)
  end
end

class MovieClientError < StandardError; end
