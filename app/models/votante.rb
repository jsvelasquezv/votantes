class Votante < ActiveRecord::Base
  acts_as_followable
  acts_as_follower
  validates :nombres, presence: true
  validates :apellidos, presence: true
  validates :cedula, presence: true, numericality: true, uniqueness: true
  validates :direccion, presence: true
  validates :barrio, presence: true
  validates :puesto, presence: true
  validates :mesa, presence: true, numericality: true
  validates :celular, presence: true, numericality: true

  def self.search(search)
    where("cedula LIKE ?", "%#{search}%")
    where("apellidos LIKE ?", "%#{search}%")
    where("nombres LIKE ?", "%#{search}%")
  end
end
