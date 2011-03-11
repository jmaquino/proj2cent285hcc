# == Schema Information
#
# Table name: suggestions
#
#  id         :integer         not null, primary key
#  first_name :text
#  last_name  :text
#  suggestion :text
#  created_at :datetime
#  updated_at :datetime
#

# app/models/suggestions.rb
class Suggestions < ActiveRecord::Base
end
