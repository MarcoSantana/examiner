class Question < ActiveRecord::Base

	belongs_to :question_set
	has_many :distractors
	has_many :pictures
	has_many :answers
	accepts_nested_attributes_for :distractors, :reject_if => :all_blank, :allow_destroy => true

	#This is for the select to be more presentable
		def truncated_content
			id.to_s+" - "+content.truncate(50,{omission: '...'})
	  end

	scope :sorted, lambda { order("questions.position ASC")  }
	scope :newest_fisrt, lambda { order("questions.created_at DESC") }
	scope :search, lambda { |query|
	 where(["name LIKE ?", "%#{query}%"]) }


end
