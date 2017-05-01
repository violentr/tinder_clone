class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_votable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :uploads

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
    :url => "users/:id/avatar/:style/:basename.:extension",
                          :path => "users/:id/avatar/:style/:basename.:extension"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def self.filter_voted_users
    includes(:uploads) - (filter_users_by("like") + filter_users_by("dislike"))
  end


  def self.filter_users_by(condition)
    liked = ActsAsVotable::Vote.where(vote_scope: condition)
    find(liked.pluck(:votable_id))
  end
end
