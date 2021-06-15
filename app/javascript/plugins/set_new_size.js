const setNewSize = () => {
  const videoPlayer = document.getElementById('video-post')
  if(videoPlayer) {
    videoPlayer.addEventListener('play', (event) => {
      videoPlayer.width = 524;
    })
  }
};

export { setNewSize }