# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  liveliness :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  validates :name, :band_id, :liveliness, presence: true
  validates :band_id, uniqueness: { scope: :name }

  has_many :tracks
  belongs_to :band

end
