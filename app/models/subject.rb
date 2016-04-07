class Subject < ActiveRecord::Base
  has_many :question_sets
end
