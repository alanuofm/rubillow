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
      attr_accessor :payments

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

        @payments = []
        @parser.xpath('//amortizationschedule/payment').each do | payment |
          temp_parser = Nokogiri::XML(payment.to_xml){|cfg|cfg.noblanks}
          temp_payment = {
              :beginning_balance => temp_parser.xpath('//beginningbalance').text,
              :amount => temp_parser.xpath('//amount').text,
              :principal => temp_parser.xpath('//principal').text,
              :interest => temp_parser.xpath('//interest').text,
              :ending_balance => temp_parser.xpath('//endingbalance').text
          }
          @payments << temp_payment
        end
      end
    end
  end
end