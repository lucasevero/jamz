class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super do |resource|
      resource.skills.build
      resource.genres.build
    end
  end
end
