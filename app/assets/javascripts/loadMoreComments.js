$( document ).ready(function(){
  $('body').on('click', '.more-comments', function(){
    console.log("works");
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var postId = $(this).data("post-id");
      $("#comments_" + postId).html(data);
      
    });
  });
});