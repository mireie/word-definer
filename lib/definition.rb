class Definition
  attr_reader :id, :definition
  @@definitions = {}
  @@total_rows = 0

  def initialize(id, definition)
    @id = id || @@total_rows += 1
    @definition = definition
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.id, self.definition)
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@definitions[id]
  end

  def ==(definition_to_compare)
    self.definition() == definition_to_compare.definition()
  end

  def delete
    @@definitions.delete(self.id)
  end

  def update(definition)
    @definition = definition
  end
end
