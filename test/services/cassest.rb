require 'rubygems'
require 'test/unit'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

class VCRTest < Test::Unit::TestCase
  def test_example_dot_com
    VCR.use_cassette("upcoming") do
      # response = Net::HTTP.get_response(URI('https://moviesdatabase.p.rapidapi.com/titles/x/upcoming'))
      

      url = URI("https://moviesdatabase.p.rapidapi.com/titles/x/upcoming")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = 'a6ee17a7fcmshf761bb4c7b31ce4p1f5232jsnd5fcb729db65'
      request["x-rapidapi-host"] = 'moviesdatabase.p.rapidapi.com'

      response = http.request(request)

      assert_match /Example domains/, response.body
    end
  end
end