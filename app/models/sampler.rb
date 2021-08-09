class Sampler < ApplicationRecord
  # リレーション
  belongs_to :user, class_name: "User", foreign_key: 'user_id'

  has_many :seboards#, class_name: "Seboard", foreign_key: 'seboard_id'
  accepts_nested_attributes_for :seboards


  has_one :sefile, :through => :seboards#, foreign_key: 'sefile_id'
  accepts_nested_attributes_for :sefile

  # バリデーション(予定)


end
