class User < T::Struct
  include Redcord::Base

  attribute :username, String, index: true
  attribute :password, String
end
