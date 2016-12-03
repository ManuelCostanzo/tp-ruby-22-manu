class Task < ApplicationRecord
  belongs_to :list
  belongs_to :status
  belongs_to :priority
end
