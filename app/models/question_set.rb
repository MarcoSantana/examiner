class QuestionSet < ActiveRecord::Base
	belongs_to :subject
	belongs_to :editor, :class_name => "User"
	has_many :question_sets_quizzes
	has_many :quizzes, :through => :question_sets_quizzes
	has_many :questions
	accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

	def to_s
	  content.html_safe
	end

#This is for the select to be more presentable
	def truncated_content
		id.to_s+" - "+content.truncate(50,{omission: '...'})
  end


	scope :visible, lambda { where(:visible => true)  }
	scope :invisible, lambda { where(:visible => false) }
	scope :locked, lambda { where(:locked => true)}
	scope :unlocked, lambda { where(:locked => false)}
	scope :sorted, lambda { order("question_sets.position ASC")  }
	scope :newest_fisrt, lambda { order("question_sets.created_at DESC") }

	# asugurarme de que esto busque por autor
	scope :search, lambda { |query|
	 where(["name LIKE ?", "%#{query}%"]) }

end
