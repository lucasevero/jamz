import Rails from '@rails/ujs';
import { fetchChatroom } from './fetch_chatroom';
import { openChat } from './open_chat';

const newChat = () => {
  const button = document.querySelector('.btn-msg')
  // console.log(button.dataset.id)
  // const button = document.querySelectorAll("a[data-id]")[0]
  if(button){
    button.addEventListener('click', (event) => {
      event.preventDefault();
      // console.log(document.getElementsByName("csrf-token"))
      // console.log(document.getElementsByName("csrf-token")[0].content)
      Rails.ajax({
        url: "/chatrooms",
        type: "post",
        data: `user_id=${button.dataset.id}`,
        success: function(data) {
          button.classList.toggle('btn-msg')
          delete button.dataset.remote
          divAction = document.querySelector('.profile-action')
          divAction.innerHTML = ""
          divAction.innerHTML = `<a href="#" class="btn-open-chat">
                                  <i class="fas fa-comments"></i>
                                  Connect
                                </a>`
          // button.removeEventListener('click', newChat, false);
          console.log(button)
          openChat();
          fetchChatroom()
          // Se quiser abrir tem que achar e clicar no javascript
        },
        error: function(data) {}
      })
    })
    
  }
}

export { newChat }
