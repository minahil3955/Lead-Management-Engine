# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "mail.google.com",
    :user_name            => "minahil.mustafa@devsinc.com",
    :password             => "minahil3955",
    :authentication       => "plain",
    :enable_starttls_auto => true
  }

  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
