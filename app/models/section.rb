class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons

  include RankedModel
  ranks :row_order_position, with_same: :course_id

  def next_section
    section = course.sections.where("row_order_position > ?", self.row_order_position).rank(:row_order_position).first
    return section
  end

  def previous_section
    section = course.sections.where("row_order_position < ?", self.row_order_position).rank(:row_order_position).last
    return section
  end


end
