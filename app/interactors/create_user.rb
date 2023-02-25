class CreateUser
  include Interactor

  def call
    context.fail! error: 'Username required' unless context.username
    context.fail! error: 'Password required' unless context.password
    context.fail! error: 'Username already taken' if User.where(username: context.username).count > 0
    context.fail! error: 'Password must be 6 characters or more' if context.password.length < 6
    context.fail! error: 'Password must contain at least one digit' if context.password.match(/\d+/).nil?
    context.fail! error: 'Password must contain at least one uppercase character' if context.password.match(/[A-Z]+/).nil?
    context.fail! error: 'Password must contain at least one lowercase character' if context.password.match(/[a-z]+/).nil?

    context.user = User.create! username: context.username, password: BCrypt::Password.create(context.password)
  end
end
