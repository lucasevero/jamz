const closeChat = () => {
  const backAction = document.getElementById('close-chat');
  backAction.addEventListener('click', (event) => {
    event.preventDefault();
    let openRoom = document.querySelector('.opened-chatroom');
    openRoom.remove();
  })
}

export { closeChat }