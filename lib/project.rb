class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @name = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.title
    
  end
end