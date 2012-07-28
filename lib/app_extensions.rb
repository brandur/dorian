module AppExtensions
  include ActiveSupport::Inflector

  def module_instances
    return unless config.modules
    config.modules.each do |module_sym, module_config|
      require "modules/#{module_sym}"
      yield module_sym.to_s.camelize.constantize.new(module_config)
    end
  end
end
