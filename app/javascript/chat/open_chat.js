// find the existing chat with current user and page_user_id
// abrir o chat na coluna da direita
const openChat = () => {
  // get btn to redirect click
  const button = document.querySelector('.btn-open-chat')
  if (button) {
    console.log(button)
    button.addEventListener('click', (event) => {
      event.preventDefault()
      //  get username without @
      // var mobileWithCode="+91-9842505145";//mobile value with nation code
      const pageUsername = document.querySelector('.username').innerText
      console.log(pageUsername)
      // get chat div username
      const chatRoom = document.querySelector(`div[data-user="${pageUsername}"]`)
      console.log(chatRoom)
      // Simulate click function
      // function clickButton() {
      chatRoom.click();
      // }
    })
  }
}

export { openChat}