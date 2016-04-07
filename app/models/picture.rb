class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  mount_uploader :file_name, FileNameUploader # Tells rails to use this uploader for this model.
  validates :file_name, presence: true#, on: :create
  validates :description, presence: true
  validates :locked, exclusion: { in: [nil] }
  validates :in_line, exclusion: { in: [nil] }
  validates :visible, exclusion: { in: [nil] }


end
