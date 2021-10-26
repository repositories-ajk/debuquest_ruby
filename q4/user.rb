require './base.rb'

class Q4::User < Base
  ROLE = { admin: '管理者', general: '一般' }
  attr_reader :name, :role

  def initialize(name:, role:)
    @name = name
    @role = role
  end

  def create_user(name:, role:)
    Q4::User.new(name: name, role: role)
  end

  def change_admin(user)
    if admmin?
      user.role = 'admin'
    else
      puts '※権限がありません※'
      puts '--------------------'
    end
  end

  def admmin?
    true
  end

  def disp_data
    puts "名前: #{name}"
    puts "権限: #{ROLE[role]}"
    puts '--------------------'
  end

  protected

  def role=(role)
    @role = role
  end
end
