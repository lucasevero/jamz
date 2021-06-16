import Rails from '@rails/ujs';
import { fetchChatroom } from './fetch_chatroom';
import { openChat } from './open_chat';

const replaceButton = () => {
  const divAction = document.querySelector('.profile-action')
  divAction.innerHTML = ""
  divAction.innerHTML = `<a href="#" class="btn-open-chat">
                          <i class="fas fa-comments"></i>
                          Connect
                        </a>`
}

const newChat = () => {
  const button = document.querySelector('.btn-msg')
  if(button){
    button.addEventListener('click', (event) => {
      event.preventDefault();
      Rails.ajax({
        url: "/chatrooms",
        type: "post",
        data: `user_id=${button.dataset.id}`,
        success: function(data) {
          replaceButton()
          openChat();
          fetchChatroom()
        },
        error: function(data) {}
      })
    })
    
  }
}

export { newChat }
