module Rubillow
  module Models
    class MonthlyPaymentsAdvanced < Base
      attr_accessor :monthly_principal_and_interest

      def parse
        super

        return if !success?

        @monthly_principal_and_interest = @parser.xpath('//monthlyprincipalandinterest').text

      end
    end
  end
end