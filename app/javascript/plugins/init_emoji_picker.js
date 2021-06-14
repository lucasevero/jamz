const initEmojiPicker = () => {

  const smile = document.querySelector(".post-emoji.smile");
  const pickEmoji = document.querySelector('emoji-picker');
  const TextInput = document.querySelector(".form--input_text");
  const emojiPicker = document.querySelector('emoji-picker');

  // Toggle emoji picker on the screen
  smile.addEventListener("click", event => {
    pickEmoji.classList.toggle("active");
  })

  // Select an emoji and insert it in the text input
  emojiPicker.addEventListener('emoji-click', event => {
    TextInput.setRangeText(event.detail.unicode);
      console.log(event.detail.unicode);
    });

};

export { initEmojiPicker };
