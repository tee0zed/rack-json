require 'json'

module JsonDump
  refine Hash do
    def to_json(*args)
      JSON.dump(self)
    end
  end
end
