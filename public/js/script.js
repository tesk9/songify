$(document).ready(function () {
  $(".edit-song").on("click", function () {
    $alb_id = $(this).data("albid")
    var $id = $(this).data("id")
    var $name = $(this).data("name")
    var $link = $(this).data("link")
    $(this).siblings(".make-edit").append("<form action='/albums/"+$alb_id+"/songs/edit/"+$id+"' method='post'><input type='text' name='name' value='"+$name+"'><input type='link' value='"+$link+"'><input type='submit'></form>")
    $(this).remove()
  });
});
