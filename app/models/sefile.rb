class Sefile < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: 'user_id', optional: true

  has_many :samplers, through: :seboards, source: :sampler, foreign_key: 'sampler_id'
  accepts_nested_attributes_for :samplers


  belongs_to :seboard, class_name: "Seboard", foreign_key: 'seboard_id' ,inverse_of: :sefile, optional: true
  # belongs_to :samplers, through: :seboards
  # has_many :seboards#, class_name: "Seboard", foreign_key: 'seboard_id'
  # accepts_nested_attributes_for :seboards



  mount_uploader :sedata, SeUploader

  # バリデーションはこれ以降に

end
