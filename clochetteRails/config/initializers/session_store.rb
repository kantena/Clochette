# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_clochetteRails_session',
  :secret      => '729dd5cdb15a1a8bb373e2e45f1fb289a36a13e7db7cfaab3b08d13a65bc4f4ad7933140076b4159ede43a28c20ce1c95dee1c3a8e780cf6435f1ed6a6d1c7b3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
