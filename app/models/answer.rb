class Answer < Bok
  belongs_to :topic, :foreign_key => :parent_id
  has_many :comments, :as => :parent


  def asamblea
    topic.asamblea
  end
end

