class Scout < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
