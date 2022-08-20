class Router
  attr_reader :routes, :env

  DIVIDER = '#'.freeze

  # @param [Hash] routes
  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    @env = env

    if routes.key?(path)
      action(path).call
    else
      # handle 404 error with JSON error message
      AppController.new.respond_error(:not_found)
    end
  rescue Exception => e
    # handle 500, rescue Exception because Rack inherit Exception for several errors
    puts e.message
    puts e.backtrace
    AppController.new.respond_error(:internal_error)
  end

  private

  def path
    env['REQUEST_PATH']
  end

  def action(path)
    lookup(routes[path])
  end

  def lookup(string)
    controller, action = string.split(DIVIDER)
    klass = Object.const_get "#{controller.capitalize}Controller"
    klass.new(action: action.to_sym)
  end
end
