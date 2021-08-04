class Seboard < ApplicationRecord
  belongs_to :sampler
  has_one :sefile
end
