# == Schema Information
#
# Table name: yoga_classes
#
#  id            :integer          not null, primary key
#  duration_secs :string
#  public_to_all :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  yogi_id       :integer
#
class YogaClass < ApplicationRecord

    belongs_to(:yogi, { :required => false, :class_name => "Yogi", :foreign_key => "yogi_id" })

    has_many(:chapters, { :class_name => "Chapter", :foreign_key => "yoga_class_id", :dependent => :destroy })

end
