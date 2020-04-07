ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    end

    columns do
      column do
        panel "All Products" do
          ul do
            Product.all.map do |product|
              li link_to(product.name, product)
            end
          end
        end
      end
    end
  end
end
