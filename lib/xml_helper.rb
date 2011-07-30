require 'open-uri'
require 'xml'

module XmlHelper
  def xml_for(uri, xpath)
    parser = XML::Parser.string(open(uri).read)
    doc = parser.parse
    doc.find(xpath).each do |x|
      yield x
    end
  end
end
