class Sampler < ApplicationRecord
  # リレーション
  belongs_to :user

  has_many :seboards
  accepts_nested_attributes_for :seboard

  has_many :sefiles
  accepts_nested_attributes_for :sefile

  has_one :sefile, through :seboards
  accepts_nested_attributes_for :sefile, through :seboards

  # バリデーション(予定)


end
