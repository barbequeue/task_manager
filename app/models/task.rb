class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true

  before_save do
    self.checked = false if checked.nil?
  end
end
