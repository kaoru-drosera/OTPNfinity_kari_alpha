class Seboard < ApplicationRecord
  belongs_to :sampler

  belongs_to :sefile

  # has_one :sefile, class_name: "Sefile", foreign_key: 'sefile_id'
  # ↑
  # has_many :sefiles
  #にするとうまくいった。
  # この調子だと下の式のものやviewとcontrollerに点在するsefileの設定も
  # 複数形にするといいのだろうが、
  # こちらを単数形にしたい。
  # accepts_nested_attributes_for :sefile
  # accepts_nested_attributes_for :sefiles

end
