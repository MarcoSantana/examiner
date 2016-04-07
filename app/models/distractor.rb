class Distractor < ActiveRecord::Base

	belongs_to :question, dependent: :destroy

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :locked, lambda { where(:locked => true)}
	scope :unlocked, lambda { where(:locked => false)}
	scope :sorted, lambda { order("distractors.position ASC")  }
	scope :newest_fisrt, lambda { order("distractors.created_at DESC") }
	scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
