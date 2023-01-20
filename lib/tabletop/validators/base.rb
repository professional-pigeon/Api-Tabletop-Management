module Tabletop
  module Validators
    module Base

      def fields
        raise NotImplementedError
      end

      def attrs
        raise NotImplementedError unless @attrs
        @attrs
      end

      def errors
        @errors ||= []
      end

      def checks
        fields.map do |key|
          ["invalid_#{key}".to_sym, "valid_#{key}?".to_sym]
        end
      end

      def validate
        @errors = checks.each.reduce([]) do |errs, (error, check)|
          errs << error_message_for(error) unless send(check)
          errs
        end
        attrs if errors.empty?
      end
    end
  end
end