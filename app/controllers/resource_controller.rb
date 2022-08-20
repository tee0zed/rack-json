class ResourceController < AppController
  def index
    data = { data: 'immaresource' }.to_json
    respond data, status: 418 # no, you are not a resource
  end
end
