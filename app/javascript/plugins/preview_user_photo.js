const previewUserPhoto = (event) => {
  const userPhoto = document.getElementById('preview-photo')
  const photoInput = document.getElementById('user_photo')

  if (photoInput) {
    photoInput.addEventListener('change', (event) => {
      if (photoInput.files && photoInput.files[0]) {
        const reader = new FileReader();
        reader.onload = (event) => {
          userPhoto.src = (event.currentTarget.result);
          userPhoto.height = 128;
        }
        reader.readAsDataURL(photoInput.files[0])
      };
    });
  };
};

// if(photoInput){
//    photoInput.addEventListener('change', (event) => {
//       displayPreview(event)
//    });
// };

export { previewUserPhoto }
