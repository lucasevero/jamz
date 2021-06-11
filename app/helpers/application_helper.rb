module ApplicationHelper
  def display_photo(user)
    if user.photo.attached?
      user.photo.key
    else
      "jun7vge4yvdmrhi3wti1.png"
    end
  end
end
