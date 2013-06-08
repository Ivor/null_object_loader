class School

  attr_accessor :name, :principal

  def initialize(name, principal = nil)
    @name = name
    @principal = principal
  end

end