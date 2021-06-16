const cleanInputMessage = () => {
  const openRoom = document.querySelector('.opened-chatroom');
  if(openRoom) {
    const messageInput = document.querySelectorAll('#message_content')
    messageInput.forEach((input) => {
      input.addEventListener('keyup', (event) => {
        if(event.keyCode == 13){
          input.value = ""
          // const messageContainer = document.querySelectorAll('#messages')
          // messageContainer[0].lastElementChild.scrollIntoView()          
        }
      })
    })
  }
}

export { cleanInputMessage }