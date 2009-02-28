# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_netcamp_session',
  :secret      => 'b23e95f1fc050c774169dbe076a4fc6bdd9bd58af354eb9fde90096924462a78db6e2049bc85eea7b7d8a274ce4dd3d08d7c7825d1d05a5308056673f624cfad'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
