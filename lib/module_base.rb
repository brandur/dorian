class ModuleBase
  attr_accessor :config

  def initialize(config)
    self.config = config
  end

  def expire_page(uri)
    @@controller ||= ApplicationController.new
    @@controller.expire_page(uri)
  end
end
