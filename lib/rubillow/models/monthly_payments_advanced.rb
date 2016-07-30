module Rubillow
  module Models
    class MonthlyPaymentsAdvanced < Base
      attr_accessor :monthly_principal_and_interest
      attr_accessor :monthly_property_taxes
      attr_accessor :monthly_hazard_insurance
      attr_accessor :monthly_pmi
      attr_accessor :monthly_hoa_dues
      attr_accessor :total_monthly_payment
      attr_accessor :total_payments
      attr_accessor :total_interest
      attr_accessor :total_principal
      attr_accessor :total_taxes_fees_and_insurance

      def parse
        super

        return if !success?

        @monthly_principal_and_interest = @parser.xpath('//monthlyprincipalandinterest').text
        @monthly_property_taxes = @parser.xpath('//monthlypropertytaxes').text
        @monthly_hazard_insurance = @parser.xpath('//monthlyhazardinsurance').text
        @monthly_pmi = @parser.xpath('//monthlypmi').text
        @monthly_hoa_dues = @parser.xpath('//monthlyhoadues').text
        @total_monthly_payment = @parser.xpath('//totalmonthlypayment').text
        @total_payments = @parser.xpath('//totalpayments').text
        @total_interest = @parser.xpath('//totalinterest').text
        @total_principal = @parser.xpath('//totalprincipal').text
        @total_taxes_fees_and_insurance = @parser.xpath('//totaltaxesfeesandinsurance').text
      end
    end
  end
end