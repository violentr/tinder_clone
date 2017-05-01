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


  def filter_voted_users(user_id)
    User.includes(:uploads) - (filter_users_by("like", user_id) + filter_users_by("dislike", user_id))
  end


  def filter_users_by(condition, user_id)
    liked = ActsAsVotable::Vote.where(vote_scope: condition, voter_id: user_id)
    User.find(liked.pluck(:votable_id))
  end
end
