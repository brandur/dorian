class ModuleBase
  attr_accessor :config

  def initialize(config)
    self.config = config
  end

  def expire_action(options)
    @@controller ||= ApplicationController.new
    @@controller.expire_action(options)
  end
end
