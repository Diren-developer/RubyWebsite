class Vote < ApplicationRecord
  belongs_to :course
  belongs_to :coordinator
end
