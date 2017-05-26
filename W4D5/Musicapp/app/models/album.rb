# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default("false"), not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  validates :name, :band_id, :year, :live, presence: true
  validates :live, :inclusion {in: [true, false]}
  validates :name, uniqueness: {scope: :band_id}
  validates :year 








end
