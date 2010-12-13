class BokAction
  def initialize(name, bok_id)
    @bok = Bok.find bok_id
    self.send(name.to_sym)
  end

  protected
  def move_higher
    @bok.move_higher
  end

  def move_lower
    @bok.move_lower
  end
end
