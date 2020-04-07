# https://gist.github.com/niinyarko/f146f24a50125d55396f63043a2696e7
module AuthenticationHelper
  include Warden::Test::Helpers

  def self.included(base)
    # TODO: admin作ったときに条件を追加する
    base.before { host! "www.lvh.me" if base.to_s =~ /Www/ }
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
    auth_headers = resource.create_new_auth_token
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json',
      'Uid' => auth_headers['uid'],
      'Access-Token' => auth_headers['access-token'],
      'Client' => auth_headers['client']
    }
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end
end