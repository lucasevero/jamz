const closeChat = () => {
  const backAction = document.getElementById('close-chat');
  backAction.addEventListener('click', (event) => {
    console.log(event.target)
    let openRoom = document.querySelector('.opened-chatroom');
    openRoom.remove()
  })
}

export { closeChat }