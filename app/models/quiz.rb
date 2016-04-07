class Quiz < ActiveRecord::Base
	has_many :question_sets_quizzes
	has_many :question_sets, :through => :question_sets_quizzes
	has_and_belongs_to_many :editors, :class_name => "User"
	has_many :answers

	scope :visible, lambda { where(:visible => true)  }
	scope :invisible, lambda { where(:visible => false) }
	scope :locked, lambda { where(:locked => true)}
	scope :unlocked, lambda { where(:locked => false)}
	scope :newest_fisrt, lambda { order("tests.created_at DESC") }
	# asugurarme de que esto busque por autor
	scope :search, lambda { |query|
	 where(["name LIKE ?", "%#{query}%"]) }

	 #Validations
	 validates_presence_of :description

end
