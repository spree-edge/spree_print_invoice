module Spree
  module Admin
    module Tabs
      module OrderDefaultTabsBuilderDecorator
        def build
          root = super

          add_bookkeeping_documents_tab(root)
          root
        end

        private

        def add_bookkeeping_documents_tab(root)
          tab =
            TabBuilder.new('documents', ->(resource) { admin_order_bookkeeping_documents_path(resource) }).
            with_icon_key('file.svg').
            with_active_check.
            with_update_ability_check.
            with_data_hook('admin_order_tabs_bookkeeping_documents').
            build

          root.add(tab)
        end
      end
    end
  end
end
::Spree::Admin::Tabs::OrderDefaultTabsBuilder.prepend(
  Spree::Admin::Tabs::OrderDefaultTabsBuilderDecorator
)
