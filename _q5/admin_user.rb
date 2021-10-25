require './q5/user.rb'

module Q5
  class AdminUser < User
    def initialize(name)
      super(name)
      @role = 'admin'
    end

    def self.create(name)
      new(name)
    end
  end
end
