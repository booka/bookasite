# Es una reuníon para debatir algo
# puede ser temporal o no
class Asamblea < Bok
  has_many :topics, :as => :parent
  property :begin_date
  property :end_date
end

