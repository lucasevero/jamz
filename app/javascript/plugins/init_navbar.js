const navHome = document.getElementById("nav-home")
const navGroups = document.getElementById("nav-groups")
const navChatrooms = document.getElementById("nav-chatrooms")
const navProfile = document.getElementById("nav-profile")

const initNavbar = () => {
  if (document.URL == "http://localhost:3000/users/1") {
    navProfile.classList.add("active");
  } else if (document.URL == "http://localhost:3000/users/feed") {
    navHome.classList.add("active");
  }
}

export { initNavbar };
