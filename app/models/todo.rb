class Todo < ApplicationRecord
  belongs_to :user

  # validations
  validates_presence_of [:content]

  # scopes
  scope :uncompleted, -> { where(:completed => false)}
  scope :completed, -> { where(:completed => true)}
end
