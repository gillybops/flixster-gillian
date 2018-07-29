class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons

  include RankedModel
  ranks :row_order_position, with_same: :course_id

end
