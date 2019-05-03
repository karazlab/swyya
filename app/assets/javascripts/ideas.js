$(function(){
  if(idea_liked){
    $('#dislike_btn').show();
    $('#like_btn').hide();
  } else {
    $('#dislike_btn').hide();
    $('#like_btn').show();
  }
});

$(function(){
  if(idea_active){
    $('#hide').show();
    $('#active').hide();
  } else {
    $('#hide').hide();
    $('#active').show();
  }
});

function likeIdea(){
  var url = '/ideas/' + idea_id + '/like';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#dislike_btn').show();
      $('#like_btn').hide();
      $('#likes_counter').text(data.data.counts);
    }
  });
}

function dislikeIdea(){
  var url = '/ideas/' + idea_id + '/dislike';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#dislike_btn').hide();
      $('#like_btn').show();
      $('#likes_counter').text(data.data.counts);
    }
  });
}

function activateIdea(){
  var url = '/ideas/' + idea_id + '/active';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#hide').show();
      $('#active').hide();
      idea_active = data.data.active;
    }
  });
}

function hideIdea(){
  var url = '/ideas/' + idea_id + '/hide';
  $.ajax({
    url: url,
    dataType: 'JSON',
    method: 'POST',
    success: function(data){
      $('#hide').hide();
      $('#active').show();
      idea_active = data.data.active;
    }
  });
}