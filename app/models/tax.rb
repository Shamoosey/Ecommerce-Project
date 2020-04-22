# frozen_string_literal: true

class Tax < ApplicationRecord
  validates :province, :gst, presence: true
  validates :pst, :gst, numericality: true
end
