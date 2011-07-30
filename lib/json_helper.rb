require 'open-uri'

module JsonHelper
  def json_for(uri)
    yield JSON.parse(open(uri).read)
  end
end
