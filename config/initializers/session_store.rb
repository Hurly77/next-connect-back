Rails.application.config.session_store :cookie_store, {
  key: "_next_connect_back", 
  domain: "next-connect-back.herokuapp.com",
  same_site: :none,
  secure: true,
  tld_length: 2
}

