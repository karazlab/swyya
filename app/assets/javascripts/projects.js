$(function(){
  if(project_liked){
    $('#dislike_btn').show();
    $('#like_btn').hide();
  } else {
    $('#dislike_btn').hide();
    $('#like_btn').show();
  }
});

function likeProject(){
  var url = '/projets/' + project_id + '/like';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST'
  });
  $('#dislike_btn').show();
  $('#like_btn').hide();
  var counter = parseInt($('#likes_counter').text()) + 1;
  $('#likes_counter').text(counter);
}

function dislikeProject(){
  var url = '/projets/' + project_id + '/dislike';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST'
  });
  $('#like_btn').show();
  $('#dislike_btn').hide();
  var counter = parseInt($('#likes_counter').text()) - 1;
  $('#likes_counter').text(counter);
}