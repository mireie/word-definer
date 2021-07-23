class Definition
  attr_reader :id
  @@definitions = {}
  @@total_rows = 0

  def initialize(id)
    @id = id || @@total_rows += 1 

  end
end