# == Schema Information
#
# Table name: suggestions_users_view
#
#  userid     :integer
#  username   :text
#  name       :text
#  password   :text
#  enc_pass   :text
#  salt       :text
#  division   :text
#  department :text
#  first_name :text
#  last_name  :text
#  suid       :integer
#  suggestion :text
#  created_at :datetime
#  updated_at :datetime
#

# app/models/suggestions_users.rb
class SuggestionsUsers < ActiveRecord::Base
  set_table_name "suggestions_users_view"
end
