$(document).ready(function(){

  $("#create-category").on('click', function(){
    var categoryName = $("#category-name").val()
    $.ajax({
      url: "/api/v1/categories",
      method: "POST",
      dataType: "JSON",
      data: {name: categoryName},
      success: function(newCategory){
        $("#categories").append(
          "<div class='category' data-post-id='" + newCategory.id + "'>" + newCategory.name + "<br><br></div>"
        )
        $("#dropdowns").append(
          "<a class='dropdown-item category-option' data-category-id='" + newCategory.id + "' href='#'>" + newCategory.name + "</a><br>"
        )
      }
    })

  })

  $(".dropdown-menu").on('click', ".category-option", function(){
    var categoryId = $(this).data("category-id")
    var subscriptionId = $(this).parent().data("subscription-id")


    // send ajax with cat-id to update the sub (PATCH /api/v1/subscriptions/:sub-id)
    // ajax returns api call which includes the updated sub data
    // hide the changed sub ( $('#sub-id-box')).hide(); )
    // change div value of #cat-id-badge to +1 its original value

    // <div id="cat-<%= cat.id%>-badge">
    //   <%= cat.subs.count %>
    // </div>
  })

});
