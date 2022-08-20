class AppController
  include ErrorHandling

  CONTENT_TYPE_JSON = 'application/json'.freeze

  attr_reader :action
  attr_accessor :status, :headers, :content

  # @param [Symbol] action
  def initialize(action: nil)
    @action = action
  end

  def call
    send(action)
    self
  end

  def respond(content = [], status: 200, headers: response_headers)
    self.status = status
    self.headers = headers
    self.content = Array(content)
  end

  def response_headers
    {"Content-Type" => CONTENT_TYPE_JSON }
  end
end
