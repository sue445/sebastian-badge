# == Schema Information
#
# Table name: plugins
#
#  id          :integer          not null, primary key
#  name        :string
#  title       :string
#  version     :string
#  wiki_url    :string
#  released_at :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_plugins_on_name  (name) UNIQUE
#

class Plugin < ActiveRecord::Base
end
