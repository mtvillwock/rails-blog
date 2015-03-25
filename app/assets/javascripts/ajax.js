$(document).ready(function() {
  addDeleteCommentListener();
  addCreateCommentListener();
})

function addDeleteCommentListener() {
  $('.comment-list').on('click', '.delete-comment', function(e) {
    deleteComment(e);
  })
}

function deleteComment(e) {
  e.preventDefault();

  var url = e.currentTarget.href
  var comment = e.currentTarget.closest('.comment')
  var id = comment.id
  var article_id = $('.article')[0].id

  var request = $.ajax({
    url: url,
    type: 'delete',
    data: { article_id: article_id, id: id },
    dateType: 'json',
  });
    request.done(function(response) {
      console.log(response);
      comment.remove();
    }).fail(function(response) {
      console.log("something is wrong in the delete call");
    }).always(function(response) {
      console.log("this always happens");
    });
}

function addCreateCommentListener() {
  $('.comment-form').on('submit', function(e) {
    createComment(e);
  })
}

function createComment(e) {
  e.preventDefault();

  var url = e.target.action;
  var data = $(e.target).serialize();

  var request = $.ajax({
    url: url,
    type: 'post',
    data: data,
    dateType: 'json'
  })

  request.done(function(response) {
    buildComment(response);
    console.log("posted comment");
  });

  request.fail(function(response) {
    console.log("comment failed to post");
  });

  request.always(function() {
    console.log("this happens regardless of comment status")
  });
}

function buildComment(data) {
  console.log(data)
  var newComment = "<div class='comment' id=" + data.id + ">"
  +"<p class='commenter'> Posted by: " + data.commenter + "</p>"
  +"<p class='comment-body'>" + data.body + "</p>"
  +"<p class='comment-links'>"
  +"<a href=" + "/articles/" + data.article_id + "/comments/" + data.id + ">Delete Comment</a></p></div>"

  $('.comment-list').append(newComment);
  debugger
  $('#' + data.id).children('p').children('a').addClass('delete-comment');
}