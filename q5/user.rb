require './base.rb'

module Q5
  class User < Base
    ROLE = { admin: '管理者', general: '一般' }
    attr_reader :name, :role

    def initialize(name:, role:)
      @name = name
      @role = role
    end

    def create_user(name:, role:)
      if admmin?
        User.new(name: name, role: role)
      else
        puts '※権限がありません※'
      end
    end

    def change_admin(user)
      if admmin?
        return puts '既に管理者です' if user.admmin?
        user.role = 'admin'
      else
        puts '※権限がありません※'
      end
    end

    def admmin?
      role == 'admin'
    end

    def disp_data
      puts '--------------------'
      puts "名前: #{name}"
      puts "権限: #{ROLE[role.to_sym]}"
      puts '--------------------'
    end

    protected

    def role=(role)
      @role = role
    end
  end
end
