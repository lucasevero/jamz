const frame = document.getElementById("gif-frame");
const gifBtn = document.getElementById("gif-btn");

const initGifBox = () => {
  if (gifBtn) {
    gifBtn.addEventListener('click', (event) => {
      frame.classList.toggle('hidden');
    });
  };
};

export { initGifBox };
