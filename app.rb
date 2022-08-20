# Main rack app file
class App
  attr_reader :router

  def initialize
    @router = Router.new(ROUTES)
  end

  def call(env)
    response = router.resolve(env)
    [response.status, response.headers, response.content]
  end

  def self.root
    File.dirname(__FILE__)
  end
end
