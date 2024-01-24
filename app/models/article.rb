class Article < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
	  # Un article doit avoir un titre
	  validates :title, presence: true, length: { minimum: 5 }
	  # Ajout activeStorage aux articles pour pouvoir faciliter
	  # has_many_attached :images, service: :local, dependent: :purge
  has_many_attached :images, dependent: :purge
end
