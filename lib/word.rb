class Word
  attr_reader :id, :word
  @@words = {}
  @@total_rows = 0

  def initialize(id, word)
    @id = id || @@total_rows += 1
    @word = word
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.id, self.word)
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end
end
