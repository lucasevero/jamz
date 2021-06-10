const navHome = document.getElementById("nav-home")
const navGroups = document.getElementById("nav-groups")
const navChatrooms = document.getElementById("nav-chatrooms")
const navProfile = document.getElementById("nav-profile")
const currentUserId = document.getElementById("current-user-id")

const initNavbar = () => {
  if (document.URL == "http://localhost:3000/users/feed") {
    navHome.classList.add("active");
  } else if (document.URL == "http://localhost:3000/groups") {
    navGroups.classList.add("active");
  } else if (document.URL == `http://localhost:3000/users/${currentUserId.innerText}/chat_memberships`) {
    navChatrooms.classList.add("active");
  } else if (document.URL == `http://localhost:3000/users/${currentUserId.innerText}`) {
    navProfile.classList.add("active");
  };
}

export { initNavbar };
