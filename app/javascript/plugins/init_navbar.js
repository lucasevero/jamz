
const initNavbar = () => {
  const navGroups = document.getElementById("nav-groups")
  if(navGroups){
    const navHome = document.getElementById("nav-home")
    const navChatrooms = document.getElementById("nav-chatrooms")
    const navProfile = document.getElementById("nav-profile")
    const currentUserId = document.getElementById("current-user-id")
    if (window.location.pathname == "/users/feed") {
      navHome.classList.add("active-nav");
    } else if (window.location.pathname == "/groups") {
      navGroups.classList.add("active-nav");
    } else if (window.location.pathname == `/users/${currentUserId.innerText}/chat_memberships`) {
      navChatrooms.classList.add("active-nav");
    } else if (window.location.pathname == `/users/${currentUserId.innerText}`) {
      navProfile.classList.add("active-nav");
    };
  }
}

export { initNavbar };
