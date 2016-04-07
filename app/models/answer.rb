class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :quiz

  scope :sorted, lambda { order("answers.position ASC")  }
  scope :newest_fisrt, lambda { order("answers.created_at DESC") }
  #Aqui debo de poner metodos que me ayuden a calificar y dar estadísticas como la velocidad de respuesta, cantidad de veces que se cambia la respuesta y otras
end
