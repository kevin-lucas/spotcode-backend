# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  before_validation :set_uid

  def is_favorite? kind, id
    self.favorites.where(favoritable_type: kind, favoritable_id: id).present?
  end

  private
  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

  has_many :favorites
  has_many :recently_heards
end
