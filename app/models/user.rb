class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  validates :first_name, :last_name, presence: true, length: { minimum: 3, maximum: 40 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  SEARCH_COLUMNS = ['first_name', 'last_name', 'email']

  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    stocks.include?(stock)
  end

  def self.search(search_param)
    search_param.strip!
    search_param.downcase!
    SEARCH_COLUMNS.inject([]) { |result, column| result + matches(column, search_param) }.uniq
  end

  private

  def self.matches(column, search_param)
    User.where("#{column} like ?", "%#{search_param}%")
  end
end
