class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :ldap_authenticatable, :trackable #, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :email, :first_name, :last_name, :admin

  has_many :assignments
  has_many :transfers
  has_many :agreements, :through => :assignments

  before_save :get_ldap_data

  default_scope :order => 'admin DESC, last_name ASC, first_name ASC'

  def get_ldap_data
    return if Rails.env == 'test'
    begin
      self.email      = Devise::LdapAdapter.get_ldap_param(self.username,"mail")
      self.first_name = Devise::LdapAdapter.get_ldap_param(self.username,"givenname")
      self.last_name  = Devise::LdapAdapter.get_ldap_param(self.username,"sn")
    rescue
      self.errors[:username] ="#{self.username} not found"
      return false
    end
  end

  def full_name
    first_name + ' ' + last_name
  end
end
