ActiveAdmin.register User do
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
