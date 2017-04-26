class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :ldap_authenticatable, :trackable #, :validatable

  has_many :assignments
  has_many :transfers
  has_many :agreements, :through => :assignments

  before_save :get_ldap_data

  default_scope  { order(:admin => :desc, :last_name => :asc, :first_name => :asc) }

  def get_ldap_data
   return if Rails.env.test? || Rails.env.development? 
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