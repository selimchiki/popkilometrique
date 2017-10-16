ActiveAdmin.register Scale do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :vehicle_type, :coefficient, :fiscal_power, :active

  form do |f|
    inputs "utilisateur" do
      input :vehicle_type
      input :coefficient
      input :fiscal_power
      input :active, as: :select
      actions
    end
  end

end
