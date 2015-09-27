require "net/http"
require "ostruct"
require "json"

class Connection
  VERB_MAP = {
    :get    => Net::HTTP::Get
  }
  ENDPOINT = "https://api.clarifai.com/v1/tag"

  def initialize(endpoint = ENDPOINT)
    uri = URI.parse(endpoint)
    @http = Net::HTTP.new(uri.host, uri.port)
  end

  def get(path, params)
    request_json :get, path, params
  end

  private
  def request_json(method, path, params)
    response = request(method, path, params)
    body = JSON.parse(response.body)

    OpenStruct.new(:code => response.code, :body => response.body)
  rescue JSON::ParserError
    response
  end

  def request(method, path, params = {})
    case method
    when :get
      full_path = encode_path_params(path, params)
      request = VERB_MAP[method.to_sym].new(full_path)
    else
      request = VERB_MAP[method.to_sym].new(path)
      request.set_form_data(params)
    end

    @http.request(request)
  end

  def encode_path_params(path, params)
    encoded = URI.encode_www_form(params)
    [path, encoded].join("?")
  end

end


# uri = URI.parse(endpoint)
# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Get.new("/?url=someurl")
# response = http.request(request)

# response.code
# response.class

# case response.code.to_i
# when 200 || 201
#   p [:success]
# when (400..499)
#   p [:bad_request]
# when (500..599)
#   p [:server_problems]
# end