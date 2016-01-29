# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  regularity :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  validates :name, :album_id, :regularity, presence: true
  validates :album_id, uniqueness: {scope: :name}

  belongs_to :album
  has_one :band, through: :album, source: :band
  
end
