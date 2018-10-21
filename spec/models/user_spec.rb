require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is valid' do
    subject(:valid_user) { User.new(name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar') }

    it { should be_valid }


    it 'has a name within the length requirements' do
      valid_user.name = 'a' * 51
      expect(valid_user).to_not be_valid
      valid_user.name = 'a' * 49
      expect(valid_user).to be_valid
    end

    it 'has an email within the length requirements' do
      valid_user.email = 'a' * 244 + '@example.com'
      expect(valid_user).to_not be_valid
      valid_user.email = 'a' * 24 + '@example.com'
      expect(valid_user).to be_valid
    end
  end

  context 'user name' do
    subject(:invalid_name_user) { User.new(name: '  ', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar') }

    it { should_not be_valid }
  end

  context 'user email' do
    subject(:email_user) { User.new(name: 'Example User', email: ' ', password: 'foobar', password_confirmation: 'foobar') }
    let(:valid_addresses) { %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn] }
    let(:invalid_addresses) { %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com] }

    it { should_not be_valid }

    it 'has a valid email' do
      valid_addresses.each do |valid_address|
        email_user.email = valid_address
        expect(email_user).to be_valid
      end
    end

    it 'has an invalid email' do
      invalid_addresses.each do |invalid_address|
        email_user.email = invalid_address
        expect(email_user).to_not be_valid
      end
    end

    context 'duplicate email' do
      subject(:email_user) { User.new(name: 'Example User', email: 'correct@maybe.com', password: 'foobar', password_confirmation: 'foobar') }
      let(:dup_email_user) { email_user.dup }

      it 'is invalid' do
        dup_email_user.email = dup_email_user.email.upcase
        email_user.save
        expect(dup_email_user).to_not be_valid
      end
    end

    context 'wonky email' do
      subject(:email_user) { User.new(name: 'Example User', email: 'WhAtisThis@CMon.com', password: 'foobar', password_confirmation: 'foobar') }

        it 'should have an email that is all lowercase' do
          email_user.save
          email_user.reload
          expect(email_user.email).to eq('whatisthis@cmon.com')
        end
    end
  end

  context 'password' do
    subject(:email_user) { User.new(name: 'Example User', email: 'WhAtisThis@CMon.com', password: 'foobar', password_confirmation: 'foobar') }

    it 'has a password' do
      email_user.password = email_user.password_confirmation = ' ' * 5
      expect(email_user).to_not be_valid
    end

    it 'has the minimum length' do
      email_user.password = email_user.password_confirmation = 'a' * 5
      expect(email_user).to_not be_valid
    end
  end
end
