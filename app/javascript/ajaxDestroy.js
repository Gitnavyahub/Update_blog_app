

document.addEventListener("DOMContentLoaded", function() {
    // Event listener for handling AJAX delete request
    document.addEventListener("ajax:success", function(event) {
      var xhr = event.detail[2];
      var articleId = xhr.responseJSON.article_id;
      var articleElement = document.getElementById("article_" + articleId);
      if (articleElement) {
        articleElement.remove();
      }
    });
  });
  