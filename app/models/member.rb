require 'digest/sha1'
class Member < ActiveRecord::Base
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  
  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 50 }
  validates :username, :length => { :within => 8..25 }, :uniqueness => true
  validates :email, :presence => true, :length => { :maximum => 100 }, 
    :format => EMAIL_REGEX, :confirmation => true
  validates :zip_code, :presence => true, :length => { :minimum => 5 }
  
  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("members.last_name ASC, members.first_name ASC")
  
  def name
    "#{first_name} #{last_name}"
  end
  
end
