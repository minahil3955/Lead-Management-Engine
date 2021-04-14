ActiveAdmin.register User do
  permit_params :email,
                :name,
                :password,
                :encrypted_password,
                :reset_password_token,
                :reset_password_sent_at,
                :remember_created_at,
                roles_attributes: [:name]
  index do
    selectable_column
    column 'Name', :name
    column 'Email', :email
    column 'Creation Deatils', :created_at
    column 'Updation Details', :updated_at
    actions defaults: true
  end
  show do
    panel 'User Details' do
      table_for user do
        column :email
        column :name
        column 'Creation', :created_at
        column 'Updation', :updated_at
        table_for user.roles do
          column 'Role', :name
        end
      end
    end
    active_admin_comments
  end

  # controller do
  #   # after_action  :send_credentails_email
  #   def send_credentails_email
  #     NewUserMailer.send_credentails_email(self).deliver
  #   end
  # end

  form do |f|
    f.semantic_errors
    f.inputs :email
    f.inputs :name
    f.inputs :password
    f.has_many :roles do |r|
      r.input :name, as: :select, collection: Role.names.keys
    end
    f.actions
  end
end
