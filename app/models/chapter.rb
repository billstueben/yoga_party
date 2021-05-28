# == Schema Information
#
# Table name: chapters
#
#  id            :integer          not null, primary key
#  duration_secs :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  yoga_class_id :integer
#
class Chapter < ApplicationRecord

    belongs_to(:yoga_class, { :required => false, :class_name => "YogaClass", :foreign_key => "yoga_class_id" })

    has_many(:poses, { :class_name => "Pose", :foreign_key => "chapter_id", :dependent => :destroy })

end
