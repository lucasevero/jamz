class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super do |resource|
      resource.skills.build
    end
  end
end
