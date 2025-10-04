module Spree
  module Admin
    module BaseHelperDecorator
      def settings_active?
        @settings_active || %w[stores zones shipping_methods oauth_applications
                               payment_methods refund_reasons reimbursement_types
                               shipping_categories store_credit_categories
                               syncs tax_categories tax_rates webhooks accounts
                               custom_domains audits exports imports return_authorization_reasons
                               documents stripe_tax_registrations members subscriptions stock_locations webhooks_subscribers print_invoice_settings].include?(controller_name)
      end

    end
  end
end
::Spree::Admin::BaseHelper.prepend(Spree::Admin::BaseHelperDecorator)
