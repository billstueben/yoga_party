# == Schema Information
#
# Table name: poses
#
#  id            :integer          not null, primary key
#  duration_secs :integer
#  name          :string
#  picture       :string
#  tips          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  chapter_id    :integer
#
class Pose < ApplicationRecord

    belongs_to(:chapter, { :required => false, :class_name => "Chapter", :foreign_key => "chapter_id" })

    validates(:name, { :presence => true })
    #validates(:name, { :uniqueness => true })

end
