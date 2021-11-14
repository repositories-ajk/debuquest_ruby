require "./base.rb"

class Q6::User < Base
  attr_accessor :name, :role
  ROLE = { admin: "管理者", general: "一般" }

  def initialize(name:, role:)
    @name = name
    @role = role
  end

  def create_user(params)
    Q6::User.new(params)
  end

  def general!
    role = :general
  end

  def admin!
    role = :admin
  end

  def grant_general_role(target_user)
    case role.to_sym
    when :admin
      target_user.general!
    when :general
      puts "※権限がありません※"
      puts "--------------------"
    end
  end

  def grant_admin_role(target_user)
    case role.to_sym
    when :admin
      target_user.admin!
    when :general
      puts "※権限がありません※"
      puts "--------------------"
    end
  end

  def disp_data
    puts "名前: #{name}"
    puts "権限: #{ROLE[role]}"
    puts "--------------------"
  end
end
