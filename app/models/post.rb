class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 100}
  validates :user_id, presence: true
  validates :message, length: {maximum: 250}
  validates :url, presence: true, format: { with: /^([a-z0-9]([-a-z0-9]*[a-z0-9])?\\.)+((a[cdefgilmnoqrstuwxz]|aero|arpa)|(b[abdefghijmnorstvwyz]|biz)|(c[acdfghiklmnorsuvxyz]|cat|com|coop)|d[ejkmoz]|(e[ceghrstu]|edu)|f[ijkmor]|(g[abdefghilmnpqrstuwy]|gov)|h[kmnrtu]|(i[delmnoqrst]|info|int)|(j[emop]|jobs)|k[eghimnprwyz]|l[abcikrstuvy]|(m[acdghklmnopqrstuvwxyz]|mil|mobi|museum)|(n[acefgilopruz]|name|net)|(om|org)|(p[aefghklmnrstwy]|pro)|qa|r[eouw]|s[abcdeghijklmnortvyz]|(t[cdfghjklmnoprtvwz]|travel)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])$/i
  }, uniqueness: true

  belongs_to :user
  has_many :rank

  before_create :upcase_title

  def upcase_title
    if title
      self.title =  title.slice(0,1).capitalize + title.slice(1..-1)
    end
  end

end
