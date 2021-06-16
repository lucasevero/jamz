const openChat = () => {
  const button = document.querySelector('.btn-open-chat')
  if (button) {
    button.addEventListener('click', (event) => {
      event.preventDefault()
      const pageUsername = document.querySelector('.username').innerText
      const chatRoom = document.querySelector(`div[data-user="${pageUsername}"]`)
      chatRoom.click();
    })
  }
}

export { openChat}