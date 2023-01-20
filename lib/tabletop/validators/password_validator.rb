require 'full_harvest/validator/base'

module Tabletop
  module Validators
    class PasswordValidator
      include Tabletop::Validator::Base

      MAX_PASSWORD_LENGTH = 72
      MIN_PASSWORD_LENGTH = 8
      REQUIRED_COMPLEXITY = 3

      def initialize(attrs)
        @attrs = attrs
      end

      def checks
        {
          :password_confirmation_mismatch => :password_matches_confirmation?,
          :password_strong_required => :password_strong_enough?
        }
      end

      def password_matches_confirmation?
        @attrs[:password] == @attrs[:password_confirmation]
      end

      def password_long_enough?
        length = @attrs[:password].length
        MAX_PASSWORD_LENGTH >= length && length >= MIN_PASSWORD_LENGTH
      end

      def password_strong_enough?
        score = password_has_uppercase_letters? + password_has_digits? + password_has_extra_chars? + password_has_downcase_letters?

        if password_long_enough? && score >= REQUIRED_COMPLEXITY
          return true
        end

        return false
      end

      def password_has_uppercase_letters?
        @attrs[:password].match(/[A-Z]/) ? 1 : 0
      end

      def password_has_digits?
        @attrs[:password].match(/\d/) ? 1 : 0
      end

      def password_has_extra_chars?
        @attrs[:password].match(/\W/) ? 1 : 0
      end

      def password_has_downcase_letters?
        @attrs[:password].match(/[a-z]{1}/) ? 1 : 0
      end

      def error_message_for(error)
        {
          password_confirmation_mismatch: "Password confirmation did not match.",
          password_strong_required: "Password should be a combination of at least 8 characters, including capital letters, lowercase letters, and at least one number or special character."
        }[error]
      end

      private
    end
  end
end
