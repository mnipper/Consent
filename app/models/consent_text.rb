# == Schema Information
#
# Table name: consent_texts
#
#  id         :integer          not null, primary key
#  text       :text
#  project_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ConsentText < ActiveRecord::Base
  validates :text, presence: true
  validates :project_id, presence: true
end
