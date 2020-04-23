# frozen_string_literal: true

# PUBLISHABLE_KEY=pk_test_OLFUuZDZIsJD4fL9FzjN4I7b00pW09hPuJ SECRET_KEY=sk_test_gkoj6rb7T4kAijYZiZl4fork00nsrabBVf
Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key: ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
