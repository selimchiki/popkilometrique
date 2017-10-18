ActiveAdmin.register Fee do
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

index do
  column :date
  column :departure
  column :arrival
  column :user
  column :cost
  actions
end


show do
  attributes_table do
    row :date
    row :attachment do
      fee.attachment? ? link_to(fee.attachment_file_name, fee.attachment.url) : content_tag(:span, "No file downloaded")
    end
  end
end


end
