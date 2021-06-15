const setNewSize = () => {
  const videoPlayers = document.querySelectorAll('.video-post')
  videoPlayers.forEach((videoPlayer) => {
    videoPlayer.addEventListener('play', (event) => {
      videoPlayer.width = 524;
    })
  })
};

export { setNewSize }