module Mandrill
  class Internal
    attr_accessor :master

    def initialize(master)
      @master = master
    end
  end
end
