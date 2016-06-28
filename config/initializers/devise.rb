Devise.setup do |config|

  config.secret_key = 'b2ac63ec41c3b99cab1e2c645acfc4e8018e727946274aef2b1debf2dec46d4124ecec7149868a9e9a75e90840bbc5469d7d5bd11fb83d2b61b447b4a7654e9e'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
