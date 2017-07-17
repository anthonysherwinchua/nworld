class CreateCodeForm < BaseForm

  attr_accessor :name, :code, :role

  ROLES = ['retailer', 'wholesaler'].freeze

  validates :name, presence: true
  validates :code, presence: true
  validates :role, inclusion: { in: ROLES }

  validate :code_uniqueness

  def initialize(name, code = SecureRandom.hex(4).upcase, role = ROLES[0])
    @name = name
    @code = code
    @role = role
  end

  def save
    if valid?
      User.transaction do
        user = User.create(user_attrs)
        user.add_role(role)
      end
    end
  end

  private

  def user_attrs
    {
      email: "user+#{User.count + 1}@nworld.com",
      password: 'password123',
      name: name,
      code: code
    }
  end

  def code_uniqueness
    errors.add(:code, 'already exists') if User.exists? code: code
  end

end
