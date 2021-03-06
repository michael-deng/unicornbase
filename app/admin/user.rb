ActiveAdmin.register User do
  permit_params :name, :email

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    id_column
    column :name
    column :email
    column :description
    actions
  end

  form do |f|
    f.inputs "User information" do
      f.input :name
      f.input :email
      f.input :description
    end
    f.actions
  end
end
