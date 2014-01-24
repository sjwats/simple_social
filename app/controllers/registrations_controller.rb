class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      binding.pry
      user_path(resource)
    end
end
