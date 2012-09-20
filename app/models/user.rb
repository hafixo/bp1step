class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  
  has_many :user_business_role  # бизнес-роли пользователя
  has_many :business_roles, :through => :user_business_role
  has_many :user_workplace # рабочие места пользователя
  has_many :workplaces, :through => :user_workplace 
  has_many :user_role, :dependent => :destroy  # роли доступа пользователя
  has_many :roles, :through => :user_role
  has_many :bproce

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # аутентификация - через БД
  #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # аутентификация - через LDAP
  devise :ldap_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
   
  before_create :create_role

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
  #before_save :get_ldap_email
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :displayname
  #attr_accessible :username, :email, :password
  before_save :get_ldap_lastname, :get_ldap_firstname, :get_ldap_displayname, :get_ldap_email

  def get_ldap_lastname
      #Rails::logger.info("### Getting the users last name")
      tempname = Devise::LdapAdapter.get_ldap_param(self.username,"sn")
      tempname = tempname.force_encoding("UTF-8")
      #puts "\tLDAP returned lastname of " + tempname
      self.lastname = tempname
  end 

  def get_ldap_firstname
      #Rails::logger.info("### Getting the users first name")
      tempname = Devise::LdapAdapter.get_ldap_param(self.username,"givenname")
      tempname = tempname.force_encoding("UTF-8")
      #puts "\tLDAP returned firstname of " + tempname
      self.firstname = tempname
  end 

  def get_ldap_displayname
      #Rails::logger.info("### Getting the users display name")
      tempname = Devise::LdapAdapter.get_ldap_param(self.username,"displayname")
      self.displayname = tempname.force_encoding("UTF-8")
  end 

  def get_ldap_email
      #Rails::logger.info("### Getting the users email address")
      tempmail = Devise::LdapAdapter.get_ldap_param(self.username,"mail")
      self.email = tempmail
  end

  
  #def get_ldap_email
  #  self.email = Devise::LdapAdapter get_ldap_param(self.username,"mail")
  #end

  def self.search(search)
   if search
      where('username LIKE ? or displayname LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  def role?(role)
    return !!self.roles.find_by_name(role)
  end 
  
  private
    def create_role
      self.roles << Role.find_by_name(:user)  if ENV["RAILS_ENV"] != 'test' 
    end
end
