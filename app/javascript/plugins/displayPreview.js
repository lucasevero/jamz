const input = document.getElementById('post_photos')
const photoPreview = document.getElementById('photo-preview')
const previews = document.getElementById('previews')

// Can be improved to display more previews

const videoHTML = (urlObject) => {
  return  `
            <video src="${urlObject}"width="200" controls>
             <source src="${urlObject}.webm" type="video/webm"><source src="${urlObject}.mp4" type="video/mp4">
             <source src="${urlObject}.ogg" type="video/ogg">
            </video>
          `
}

const displayPreview = (event) => {
  if (input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      if(input.files[0].type.split("/")[0] == 'image'){
        reader.onload = (event) => {
          photoPreview.src = event.currentTarget.result;
          photoPreview.width = 150
        };
      }
      if(input.files[0].type.split("/")[0] == 'video') {
        let file = event.target.files[0];
        let blobURL = URL.createObjectURL(file);
        previews.insertAdjacentHTML('beforeend', videoHTML(blobURL))
      }
      reader.readAsDataURL(input.files[0])
      document.getElementById('photo-preview').classList.remove('hidden');
    };
  };
};


if(input){
   input.addEventListener('change', (event) => {
      displayPreview(event)
   });
};

export { displayPreview }




// for (var i = 0; i < files.length; i++) {
//   var name = files[i].name;
//   var type = files[i].type;
//   console.log("Filename: " + name + " , Type: " + type);
// }
