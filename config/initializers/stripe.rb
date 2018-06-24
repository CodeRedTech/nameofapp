if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_SvdmW02CgnY4JOK2raBdkC4R',
    secret_key: 'sk_test_QtEdWhQ8EwQ4PgW5mVzKp4NK'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]