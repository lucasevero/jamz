const initProfileNav = () => {
  const navItems = document.querySelectorAll('.profile-nav-item');
  if (navItems[0]) {
    navItems.forEach((item) => {
      item.addEventListener('click', (event) => {
        navItems.forEach((navItem) =>{
          navItem.classList.remove('active');
          document.getElementById(`${navItem.id}-card`).style.display = 'none';
        })
        item.classList.add('active');
        document.getElementById(`${item.id}-card`).style.display = 'block';
      })
    })
  }
};

export { initProfileNav }
