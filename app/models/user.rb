class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :ldap_authenticatable, :trackable #, :validatable

  has_many :assignments
  has_many :transfers
  has_many :agreements, :through => :assignments

  # before_save :get_ldap_data
  before_save :check_email

  default_scope  { order(:admin => :desc, :last_name => :asc, :first_name => :asc) }

  # def get_ldap_data
  #  return if Rails.env.test? || Rails.env.development?
  #   begin
  #     self.email      = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
  #   rescue
  #     self.errors.add(:email, "#{self.username} email not found")
  #     throw(:abort)
  #   end
  #   begin
  #     self.first_name = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenname").first
  #   rescue
  #     self.errors.add(:first_name, "#{self.username} first_name not found")
  #     throw(:abort)
  #   end
  #   begin
  #     self.last_name  = Devise::LDAP::Adapter.get_ldap_param(self.username,"sn").first
  #   rescue
  #     self.errors.add(:last_name, "#{self.username} last_name not found")
  #     throw(:abort)
  #   end
  # end

  def full_name
    first_name + ' ' + last_name
  end

  def check_email
    unless self.email.include? "@mtholyoke.edu"
      self.errors.add(:email, "is not valid.")
      throw(:abort)
    end
  end
end
