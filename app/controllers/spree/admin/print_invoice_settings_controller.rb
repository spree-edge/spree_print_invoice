module Spree
  module Admin
    class PrintInvoiceSettingsController < ResourceController
      def update
        settings = Spree::PrintInvoiceSetting.new
        preferences = params && params.key?(:preferences) ? params.delete(:preferences) : params
        preferences.each do |name, value|
          # need to check logic for checking preferences with spree 5
          # next unless settings.has_preference? name.to_param
          Spree::PrintInvoice::Config[name] = value
        end
        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:settings, scope: :print_invoice))
        redirect_to edit_admin_print_invoice_settings_path
      end
    end
  end
end
