class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :ldap_authenticatable, :trackable #, :validatable

  has_many :assignments
  has_many :transfers
  has_many :agreements, :through => :assignments

  # before_save :get_ldap_data

  default_scope  { order(:admin => :desc, :last_name => :asc, :first_name => :asc) }

  # TODO: figure out why these were nil after LDAP server switch
  # def get_ldap_data
  #   return if Rails.env.test? || Rails.env.development?
  #   begin
  #     self.email      = Devise::LDAP::Adapter.get_ldap_param(self.username, "mail").first
  #     self.first_name = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenname").first
  #     self.last_name  = Devise::LDAP::Adapter.get_ldap_param(self.username,"sn").first
  #   rescue
  #     self.errors.add(:username, "#{self.username} missing LDAP parameter(s)")
  #     throw(:abort)
  #   end
  # end

  def full_name
    first_name + ' ' + last_name
  end
end
