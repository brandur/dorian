require 'ostruct'

module ConfigurableExtensions
  def for_module(sym)
    config.modules = [] unless config.modules
    config.modules << sym
    module_config = OpenStruct.new
    yield module_config
    config.send("#{sym}=", module_config)
  end
end

