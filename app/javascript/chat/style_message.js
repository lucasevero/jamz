const styleMessage = () => {
  const allMessages = document.querySelectorAll('[data-user-id]');
  const lastMessage = allMessages[allMessages.length - 1]
  const lastMessageAuthorId = lastMessage.dataset.userId;
  const currentUserId = document.getElementById('current-user-id').innerText;

  if(lastMessageAuthorId != currentUserId) {
    lastMessage.firstElementChild.classList.add('friend')
    lastMessage.lastElementChild.classList.add('friend') 
    lastMessage.lastElementChild.style.color = '#4C5A5B'
  }
}

export { styleMessage }