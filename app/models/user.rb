# frozen_string_literal: true

class User < ApplicationRecord
  has_many :offers
  has_many :assessments
  enum status: {
    account_created: 0,
    delegation_agreed: 1,
    docs_agreed: 2,
    docs_sent: 3,
    docs_returned: 4,
    agency_selected: 5,
    property_assessed: 6,
    mediation_agreed: 7,
    mediation_signed: 8,
    candidate_found: 9,
    candidate_chosen: 10,
    buy_contract_agreed: 11,
    buy_contract_signed: 12,
    all_completed: 13,
    cancel: 20
  }

  has_one :property
  has_one :buy_contract

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :address, presence: true
  validates :tel, presence: true
end
