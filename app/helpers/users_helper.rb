module UsersHelper
  def get_initials(name)
    name.split.map(&:first).join.upcase
  end
end
