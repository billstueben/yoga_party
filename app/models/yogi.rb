# == Schema Information
#
# Table name: yogis
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Yogi < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:yoga_classes, { :class_name => "YogaClass", :foreign_key => "yogi_id", :dependent => :destroy })

end
