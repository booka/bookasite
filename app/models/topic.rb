class Topic < Bok
  belongs_to :asamblea, :foreign_key => :parent_id
  has_many :comments, :as => :parent
  has_many :answers, :as => :parent
  has_many :agreements, :as => :parent
  has_many :tasks, :as => :parent

  validates_presence_of :parent_id
end

