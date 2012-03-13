# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cassandra_hits_session',
  :secret      => 'b12aa79d4f61aa0bac4a9535eec2b6bbb71258ee142ea9eb1fa460bfc8ab77f04aad24207ea097d41b5de9aaffde4a3fa05d575490b1fc0008fe3550a2a260f8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
