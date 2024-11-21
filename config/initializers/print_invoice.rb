Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.insert_after('dashboard', ::SpreePrintInvoice::Admin::MainMenu::PrintInvoiceBuilder.new.build)

     Rails.application.config.spree_backend.main_menu.add_to_section('settings',
      ::Spree::Admin::MainMenu::ItemBuilder.new('print_invoice.settings', ::Spree::Core::Engine.routes.url_helpers.edit_admin_print_invoice_settings_path).
        with_manage_ability_check(::Spree::BookkeepingDocument).
        build
      )
  end
end
