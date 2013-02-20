module Admin::UsersHelper

  def role(number)
    case number
    when 1
      "Administrator"
    when 2
      "User"
    end
  end

end
