class Sampler < ApplicationRecord
  # リレーション
  belongs_to :user#, class_name: "User", foreign_key: 'user_id'


  has_one :sefile, through: :seboards, source: :sefile, foreign_key: 'sefile_id'
  accepts_nested_attributes_for :sefile

  has_many :seboards, inverse_of: :sampler#, class_name: "Seboard", foreign_key: 'seboard_id'
  accepts_nested_attributes_for :seboards

  #

  # 検索機能
  include AlgoliaSearch

  algoliasearch do
    attribute :sampler_name
    searchableAttributes %w[sampler_name]
  end
  # バリデーション(予定)


end
