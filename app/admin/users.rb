ActiveAdmin.register User do
  index do
    selectable_column
    column 'User Email', :email
    column 'Password', :password
    column 'Role/s', :name
    column 'Creation Deatils', :created_at
    column 'Updation Details', :updated_at
    actions defaults: true
  end
  show do
    panel 'User Details' do
      table_for user do
        column :email
        column :password
        column :created_at
        column :updated_at
        column :name
      end
    end
    active_admin_comments
  end

  controller do
    def permitted_params
      params.permit user: [:email, :password, :encrypted_password, :reset_password_token,
      :reset_password_sent_at, :remember_created_at, roles_attributes: [:name]]
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs :email
    f.inputs :password
    f.has_many :roles do |r|
      r.inputs :name
    end
    f.actions
  end
end
