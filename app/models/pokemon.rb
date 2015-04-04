# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  level      :integer
#  trainer_id :integer
#  created_at :datetime
#  updated_at :datetime
#  health     :integer
#

class Pokemon < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	belongs_to :trainer
end
