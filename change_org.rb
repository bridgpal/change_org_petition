require 'net/https'
require 'json'

api_key = 'APIKEYHERE'
request_url ="https://api.change.org/v1/petitions/get_id"
petition_url = "http://www.change.org/petitions/united-healthcare-stop-cutting-off-medical-coverage-for-autism-at-age-9-2"


def get_contents(final_url)
uri = URI.parse(final_url)
http = Net::HTTP.new(uri.host,uri.port)
http.use_ssl=true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
end


paramaters = {:api_key => api_key, :petition_url => petition_url}
query_string = URI.encode_www_form(paramaters)
final_request_url= request_url + "?"+query_string


response = get_contents(final_request_url)

json_response = JSON.parse(response.body)
petition_id = json_response["petition_id"]

puts petition_id
