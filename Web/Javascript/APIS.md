```javascript
// URL (required), options (optional)
fetch('https://url.com/some/url')
  .then(function(response) {
    // Successful response :)
  })
  .catch(function(err) {
    // Error :(
  });
```


```javascript
fetch('url.url.com/api', {
  mode: 'cors'
});
```



```html
<script>
  const img = document.querySelector('img');
  fetch('https://api.giphy.com/v1/gifs/translate?api_key=YOUR_KEY_HERE&s=cats', {mode: 'cors'})
    .then(function(response) {
      return response.json();
    })
    .then(function(response) {
      img.src = response.data.images.original.url;
    });
</script>
```


https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch fetch