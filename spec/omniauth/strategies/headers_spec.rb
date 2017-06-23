require "spec_helper"

RSpec.describe OmniAuth::Strategies::Headers do
  let(:app) do
    Rack::Builder.new do |b|
      b.use Rack::Session::Cookie, :secret => 'abc123'
      b.use OmniAuth::Strategies::Headers
      b.run lambda { |_env| [200, {}, ['Not Found']] }
    end.to_app
  end

  context 'callback phase' do
    let(:auth_hash) { last_request.env['omniauth.auth'] }
    let(:auth_headers) { { 'HTTP_USER_ID' => 'testuser', 'HTTP_EMAIL' => 'testuser@example.com' } }

    context 'with default options' do
      before do
        post '/auth/headers/callback', {}, auth_headers
      end

      it 'sets the uid in auth hash' do
        expect(auth_hash.info.uid).to eq('testuser')
      end

      it 'sets the email in the auth hash' do
        expect(auth_hash.info.email).to eq('testuser@example.com')
      end

      it 'sets the uid to the name' do
        expect(auth_hash.uid).to eq('testuser')
      end
    end
  end
end
