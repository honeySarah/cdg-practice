class LabReport < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 500 }
  enum grade: { A: 'A', B: 'B', C: 'C', D: 'D', E: 'E', FX: 'FX', F: 'F' }
end
