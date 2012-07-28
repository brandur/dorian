require 'ostruct'

module ConfigurableExtensions
  def for_module(sym)
    module_config = OpenStruct.new
    yield module_config
    config.modules ||= []
    config.modules << [sym, module_config]
  end
end
