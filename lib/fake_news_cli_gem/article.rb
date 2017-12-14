class FakeNewsCliGem::FullAnswer
  attr_accessor :id, :title, :author, :publish_date, :text, :more_link, :sources

  def initialize(name)
    @name = name
  end

end
