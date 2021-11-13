require "./base.rb"

class Q4::User < Base
  attr_accessor :name, :role
  ROLE = { admin: "管理者", general: "一般" }

  def initialize(name:, role:)
    @name = name
    @role = role
  end

  def create_user(params)
    case role.to_sym
    when :admin
      Q4::User.new(params)
    when :general
      puts "※権限がありません※"
      puts "--------------------"
    end
  end

  def grant_admin_role(target_user)
    case role.to_sym
    when :admin
      target_user.role = "admin"
    when :general
      puts "※権限がありません※"
      puts "--------------------"
    end
  end

  def disp_data
    puts "名前: #{name}"
    puts "権限: #{ROLE[role.to_sym]}"
    puts "--------------------"
  end
end
