class Sefile < ApplicationRecord
  belongs_to :user
  belongs_to :samplers, through :seboards
end
