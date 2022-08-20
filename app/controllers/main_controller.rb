class MainController < AppController
  def index
    data = { data: 'haters gonna hate~' }.to_json
    respond data, status: 200
  end
end
