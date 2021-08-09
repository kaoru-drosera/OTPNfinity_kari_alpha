class Sefile < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: 'user_id'
  # belongs_to :samplers, through: :seboards
  has_many :seboards#, class_name: "Seboard", foreign_key: 'seboard_id'
  accepts_nested_attributes_for :seboards

  # has_many :samplers#, class_name: "Seboard", foreign_key: 'seboard_id'
  # accepts_nested_attributes_for :samplers




  mount_uploader :sedata, SeUploader

  # バリデーションはこれ以降に

end
