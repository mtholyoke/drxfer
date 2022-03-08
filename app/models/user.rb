class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :ldap_authenticatable, :trackable #, :validatable

  has_many :assignments
  has_many :transfers
  has_many :agreements, :through => :assignments

  validate :both_names_cannot_be_blank

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

  def both_names_cannot_be_blank
    if first_name.blank? && last_name.blank?
      errors.add(:base, "must have a first name and/or last name")
    end
  end

  def full_name
    if first_name.blank?
      last_name
    elsif last_name.blank?
      first_name
    else
      first_name + ' ' + last_name
    end
  end
end
