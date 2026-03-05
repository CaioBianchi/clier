class Tool < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :favorites

  before_validation :generate_slug, on: :create
  validates :slug, presence: true, uniqueness: true

  scope :spotlighted, -> { where(spotlighted: true) }

  def self.set_spotlight!(tool)
    transaction do
      spotlighted.where.not(id: tool.id).update_all(spotlighted: false)
      tool.update!(spotlighted: true)
    end
  end

  def to_param
    slug
  end

  private

  def generate_slug
    return if slug.present?
    return unless name

    base_slug = name.parameterize
    self.slug = base_slug
    count = 2
    while Tool.exists?(slug: self.slug)
      self.slug = "#{base_slug}-#{count}"
      count += 1
    end
  end
end
