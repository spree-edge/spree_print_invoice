module Spree
  module Admin
    module MainMenu
      module DefaultConfigurationBuilderDecorator
        def add_orders_section(root)
          super

          section = root.items.find { |s| s.key == 'orders' }
          return unless section

          section.items << ItemBuilder.new('bookkeeping_documents', admin_bookkeeping_documents_path).
            with_manage_ability_check(Spree::BookkeepingDocument).
            with_match_path('/bookkeeping_documents').
            build

            section.items << ItemBuilder.new('print_invoice_settings', edit_admin_print_invoice_settings_path).
            with_manage_ability_check(Spree::PrintInvoiceSetting).
            with_match_path('/print_invoice_settings/edit').
            build
        end
      end
    end
  end
end

::Spree::Admin::MainMenu::DefaultConfigurationBuilder.prepend(
  Spree::Admin::MainMenu::DefaultConfigurationBuilderDecorator
)
