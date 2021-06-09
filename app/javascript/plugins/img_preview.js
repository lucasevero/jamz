const imagePreview = () => {
  preview = document.getElementById('img-upload')
  preview.addEventListener('change', () => {
    console.log('i changed');
  });
  preview.addEventListener('change', (event) => {
    // Do something (callback)
  });
}

export { imagePreview }