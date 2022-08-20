# Errored response data wrapper
module ErrorHandling
  ERROR_RES = {
    not_found: [
      404,
      { 'Content-Type' => 'application/json' },
      [{ error: 'Not found' }.to_json]
    ],
    internal_error:  [
      500,
      { 'Content-Type' => 'application/json' },
      [{ error: 'Internal error' }.to_json]
    ]
  }.freeze

  def respond_error(error)
    response = error_response(error)

    self.status = response[0]
    self.headers = response[1]
    self.content = response[2]
    self
  end

  def error_response(error)
    ERROR_RES[error]
  end
end
