class Seboard < ApplicationRecord
  belongs_to :sampler,inverse_of: :seboards#, class_name: "Sampler", foreign_key: 'sampler_id'

  has_one :sefile,inverse_of: :seboard#, class_name: "Sefile", foreign_key: 'sefile_id'
  accepts_nested_attributes_for :sefile




end
