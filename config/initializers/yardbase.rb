if Rails.env.production?
  Yardbase::HOST = "madison.yardbase.org"
else
  Yardbase::HOST = "madison.lvh.me:3000"
end